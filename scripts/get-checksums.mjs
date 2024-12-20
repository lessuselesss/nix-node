// Run with: deno run --allow-net --allow-run get-checksums.mjs
const versions = await (async () => {
  const page = await fetch("https://nodejs.org/download/release/");
  const pageText = await page.text();
  return pageText.split("\n").reduce((agg, row) => {
    const match = /href="v(\d+\.\d+\.\d+)\/"/.exec(row);
    return match === null ? agg : [...agg, match[1]];
  }, []);
})();

const getChecksum = async (version) => {
  const p = Deno.run({
    cmd: [
      "nix-prefetch-url",
      "--type",
      "sha256",
      `https://nodejs.org/dist/v${version}/node-v${version}.tar.xz`,
    ],
    stdout: "piped",
  });
  if (!(await p.status()).success) {
    return;
  }
  const output = new TextDecoder().decode(await p.output());
  return /\w{52}/.exec(output)[0];
};

const semverSort = (a, b) => {
  const [majA, minA, patchA] = a.split(".");
  const [majB, minB, patchB] = b.split(".");
  if (majA !== majB) {
    return parseInt(majA) - parseInt(majB);
  }

  if (minA !== minB) {
    return parseInt(minA) - parseInt(minB);
  }

  return parseInt(patchA) - parseInt(patchB);
};

const results = await Promise.all(
  versions
    // Filter for versions 21-23
    .filter((v) => {
      const major = parseInt(v.split('.')[0]);
      return major >= 21 && major <= 23;
    })
    .sort(semverSort)
    .map(async (version) => ({
      version,
      checksum: await getChecksum(version),
    }))
);

results.reverse();

// Print derivation
results.forEach(({ version, checksum }) => {
  console.log(`v${version.replaceAll(".", "_")} = (buildNodejs {
  enableNpm = true;
  version = "${version}";
  sha256 = "${checksum}";
  patches = lib.optional stdenv.isDarwin ./bypass-xcodebuild.diff;
});`);
});

// Print derivation entrypoint
results.forEach(({ version }) => {
  const [major, minor, patch] = version.split('.');
  console.log(`"${minor}"."${patch}" = v${major}_${minor}_${patch};`)
})

// Print versions for CI usage
results.forEach(({ version }) => console.log(`- ${version}`));
