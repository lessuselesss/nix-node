{
  description = "NodeJS releases for use with nix";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system:
      with nixpkgs.legacyPackages.${system}; {
        packages = let
          buildNodejs20 = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" {
            icu = icu72;
            python = python3;
          };
          buildNodejs = callPackage "${nixpkgs}/pkgs/development/web/nodejs/nodejs.nix" {
            icu = icu68;
            python = python3;
          };
          v23_3_0 = buildNodejs20 {
            enableNpm = true;
            version = "23.3.0";
            sha256 = "1hf593ykl217dbnxnhfzk4is67zw0p1g363g9czp5ipf39hvb9j2";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };

          # 23.2.1 is not available

          # v23_2_1 = buildNodejs20 {
          #   enableNpm = true;
          #   version = "23.2.1";
          #   sha256 = "SHA256_PLACEHOLDER_FETCH";
          #   patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          # };

          v23_2_0 = buildNodejs20 {
            enableNpm = true;
            version = "23.2.0";
            sha256 = "1irggdg53pnrmnqqgap218yaswsrpc0yj78zd69mcxw2csisixrw";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };

          # 23.1.1 is not available

          # v23_1_1 = buildNodejs20 {
          #   enableNpm = true;
          #   version = "23.1.1";
          #   sha256 = "SHA256_PLACEHOLDER_FETCH";
          #   patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          # };

          v23_1_0 = buildNodejs20 {
            enableNpm = true;
            version = "23.1.0";
            sha256 = "08s498x486nklw1kjk6yzdqsl7jv47nshq4f5gm014qzslyzvjsp";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v23_0_0 = buildNodejs20 {
            enableNpm = true;
            version = "23.0.0";
            sha256 = "1jlynx1hscf6d82m1xrm8xypqn2zvhsp9b11vvvpnjbwr6r01j3r";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v22_5_0 = buildNodejs20 {
            enableNpm = true;
            version = "22.5.0";
            sha256 = "1hcvzyrwwmylap8agk82vb3v9bc9hcjh8x2kd23rvg8s2r6269w3";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v22_4_0 = buildNodejs20 {
            enableNpm = true;
            version = "22.4.0";
            sha256 = "1xb567czakvi6azs8mb2xc16rrhng9rb329zi14i78apk8ydhb5n";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          # v22_3_1 = buildNodejs20 {
          #   enableNpm = true;
          #   version = "22.3.1";
          #   sha256 = "SHA256_PLACEHOLDER_FETCH";
          #   patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          # };
          v22_3_0 = buildNodejs20 {
            enableNpm = true;
            version = "22.3.0";
            sha256 = "0mbb2c9pnjc56lda3ka2j13gynsabx26g8k1yfwbcfh9ad44h9k3";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v22_2_0 = buildNodejs20 {
            enableNpm = true;
            version = "22.2.0";
            sha256 = "0m8hih8pklb08bigvc8r4c00frjksvd8y8hqq4yfqsma805cw412";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v22_1_0 = buildNodejs20 {
            enableNpm = true;
            version = "22.1.0";
            sha256 = "0nwvhyl4xf4p68g7rmb1iki947zkil035b3gvxkkybv1d566cy8i";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v22_0_0 = buildNodejs20 {
            enableNpm = true;
            version = "22.0.0";
            sha256 = "1inh0gc85y1wb3vsg5lyw53na32iigcz20gc513wpa34cm45gka7";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v21_6_2 = buildNodejs20 {
            enableNpm = true;
            version = "21.6.2";
            sha256 = "1q7kq60lkdwh7jn3bs6mzjdhwd8440n45j24541za13yxhvgn84h";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v21_6_1 = buildNodejs20 {
            enableNpm = true;
            version = "21.6.1";
            sha256 = "1mflzpcw2nrw0avzh0g47y52mf77v6hvvmfg9v4cxvf2ch6lsa3y";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v21_6_0 = buildNodejs20 {
            enableNpm = true;
            version = "21.6.0";
            sha256 = "1dc97p1510xsxzgaiijc4pvbjddjph55ji3y8iafr63kc3ql5qrm";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v21_5_0 = buildNodejs20 {
            enableNpm = true;
            version = "21.5.0";
            sha256 = "1nhn9h7kra52naj71rrmwph9a5yly7ix2adh4m9ybrqvn5hsgyb4";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v21_4_0 = buildNodejs20 {
            enableNpm = true;
            version = "21.4.0";
            sha256 = "1nhn9h7kra52naj71rrmwph9a5yly7ix2adh4m9ybrqvn5hsgyb4";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v21_3_0 = buildNodejs20 {
            enableNpm = true;
            version = "21.3.0";
            sha256 = "1v4w19m0jbyiih3jyz4ryxg8dyp714sp9k7fxavvb4kqscc78xp8";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v21_2_0 = buildNodejs20 {
            enableNpm = true;
            version = "21.2.0";
            sha256 = "1mp82v3rhhj5y2gxaqf6rz5mm22wg0w5x0rfbn76mn8qia1l8pnf";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v21_1_0 = buildNodejs20 {
            enableNpm = true;
            version = "21.1.0";
            sha256 = "1hvwm4wgkz7nmg833hyy0mxbsibxiqh1a6mvh9m6axwribxgpql6";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v21_0_0 = buildNodejs20 {
            enableNpm = true;
            version = "21.0.0";
            sha256 = "1bph8b0d4dgabmfag5265jm6v8l6xaad23xkw2413x7fjzjlzjfj";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_8_0 = buildNodejs20 {
            enableNpm = true;
            version = "20.8.0";
            sha256 = "0k3hf41kdj4yylcyjm730ah7mdp5dczcr8wxp8811xkdmr3yhas1";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_7_0 = buildNodejs20 {
            enableNpm = true;
            version = "20.7.0";
            sha256 = "1siby56zq5jl7zihmpcpwpy5rcw5vxs6cncn0m41f5a6bk8drkrz";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_6_1 = buildNodejs20 {
            enableNpm = true;
            version = "20.6.1";
            sha256 = "0avadhibwmdwcxabnfcsaai69028schr44iv6h680f5aimr5xv1s";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_6_0 = buildNodejs20 {
            enableNpm = true;
            version = "20.6.0";
            sha256 = "1ynnlwq9v6p89p7q1qw41hwp7v8dnflkfz8dig9ihjwggax5rywy";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_5_1 = buildNodejs20 {
            enableNpm = true;
            version = "20.5.1";
            sha256 = "14212g44jq2q912zvjv6h0jp39cij7lki9dzawb8dhiq5ym73723";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_5_0 = buildNodejs20 {
            enableNpm = true;
            version = "20.5.0";
            sha256 = "0n70f8gn9bz33vx2qzy1j0aysqfaa8dvfycs0r7c1wfyb1lpacnb";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_4_0 = buildNodejs20 {
            enableNpm = true;
            version = "20.4.0";
            sha256 = "0j2kxs8cxy61hd2vjxf9hynyfqh9s62xipsxkl13rdi6qmrhpg89";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_3_1 = buildNodejs20 {
            enableNpm = true;
            version = "20.3.1";
            sha256 = "14cr7x7wzn5kw2q0369z66qqd2c4jxgildcv72s5jyb90srjva0j";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_3_0 = buildNodejs20 {
            enableNpm = true;
            version = "20.3.0";
            sha256 = "0dbl9x2yzjbzb54gk3jnssvrrvlkcji3xfv6j1r7afpd4fad9a0v";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_2_0 = buildNodejs20 {
            enableNpm = true;
            version = "20.2.0";
            sha256 = "12grrpplasg4vqbq92b0sk78dqn2afq6j7zz2jbmcdbc67r3sli2";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_1_0 = buildNodejs20 {
            enableNpm = true;
            version = "20.1.0";
            sha256 = "1d9njij0d4laipcywkbqfi15dbgn319src92j55q3589hq8rw3v0";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v20_0_0 = buildNodejs20 {
            enableNpm = true;
            version = "20.0.0";
            sha256 = "1dawgfblpki21di5jv5359xq78id8z7cz1c1775x3xv8jmbyfl3l";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v16_3_0 = buildNodejs {
            enableNpm = true;
            version = "16.3.0";
            sha256 = "eqtHuCwZcCxzsoNKYjw5MnMqFRhf3eoUud3HEJNvrF8=";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v16_2_0 = buildNodejs {
            enableNpm = true;
            version = "16.2.0";
            sha256 = "0Pk7mEKvuPI8B4YunNSCJucQRUf3skFdJQ/bdS0bNc8=";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v16_1_0 = buildNodejs {
            enableNpm = true;
            version = "16.1.0";
            sha256 = "0z0808mw674mshgbmhgngqfkrdix3b61f77xcdz7bwf1j87j7ad0";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v16_0_0 = buildNodejs {
            enableNpm = true;
            version = "16.0.0";
            sha256 = "00mada0vvybizygwhzsq6gcz0m2k864lfiiqqlnw8gcc3q8r1js7";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_14_0 = buildNodejs {
            enableNpm = true;
            version = "15.14.0";
            sha256 = "0vm6jdazqjd1plqsgngzvjrafv2d3mdahk6il4ray02gx97dq8l1";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_13_0 = buildNodejs {
            enableNpm = true;
            version = "15.13.0";
            sha256 = "1wd859bxd8j97xl98k61g0vwcmy83wvjj04fgway38aapk9abp4h";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_12_0 = buildNodejs {
            enableNpm = true;
            version = "15.12.0";
            sha256 = "0c8smzc7gbr7yg4y4z68976wk5741bspggag9h9laykq4i8bxfsy";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_11_0 = buildNodejs {
            enableNpm = true;
            version = "15.11.0";
            sha256 = "1lfjm0jgzbr0a874c04pddbjnvjcdyx5vyaakdhp0fa222i92w0s";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_10_0 = buildNodejs {
            enableNpm = true;
            version = "15.10.0";
            sha256 = "1i7fdlkkyh5ssncbvxmiz894a12mww4cmj7y4qzm9ddbbvqxhj3p";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_9_0 = buildNodejs {
            enableNpm = true;
            version = "15.9.0";
            sha256 = "1hyq6zj2z3kyfpa8znxa6jwzkw9bvb8mssalify2sjiv00f9dmxx";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_8_0 = buildNodejs {
            enableNpm = true;
            version = "15.8.0";
            sha256 = "1a9h88zdzk98k618jascfrivq3v51viw60sfyxn0ci0l33vf4fp2";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_7_0 = buildNodejs {
            enableNpm = true;
            version = "15.7.0";
            sha256 = "1nnv5337p23mhp0s2zgv75yysgfai0px8h1kks2mc8w0xnmwwppg";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_6_0 = buildNodejs {
            enableNpm = true;
            version = "15.6.0";
            sha256 = "1liqkh1gz1h37fln8xr5krbs2mqjn38n3sws2ydvk84wrpfq3prr";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_5_1 = buildNodejs {
            enableNpm = true;
            version = "15.5.1";
            sha256 = "0qbb4dwgsy1a82ihjxl6r8bj7mwjzb21s720y1rahisd5p69l8ic";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_5_0 = buildNodejs {
            enableNpm = true;
            version = "15.5.0";
            sha256 = "1wzcypb1kawc6m5q36cd31qjg7ljby8py9qg555m4bqm5gpvvfjg";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_4_0 = buildNodejs {
            enableNpm = true;
            version = "15.4.0";
            sha256 = "0kp0hckhjkmaqyvjpcj17rj6fw9fg3c95j78r2nr10bc65anjwms";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_3_0 = buildNodejs {
            enableNpm = true;
            version = "15.3.0";
            sha256 = "0h625hhswwv5rpijacxiak28fy5br8kpxrihfcjdqwm3dvyvkc1v";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_2_1 = buildNodejs {
            enableNpm = true;
            version = "15.2.1";
            sha256 = "0gp8z68h888x2ql64aiicgs7k065lg755cbjlnkbzdih5bh32qjn";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_2_0 = buildNodejs {
            enableNpm = true;
            version = "15.2.0";
            sha256 = "022kw29sjf46mgvwciihi2cmf9sfjpqi0xih8xpk7xiwfmx02ypn";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_1_0 = buildNodejs {
            enableNpm = true;
            version = "15.1.0";
            sha256 = "1fd0ck6nlmp937j00y17q2k9xszzwf4s383p1z4v4qzj0qzxflvk";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_0_1 = buildNodejs {
            enableNpm = true;
            version = "15.0.1";
            sha256 = "03xxnl7q96fmm7lalliwb9kmllz52jqrcsqn9cx9pzhwd1x97l5q";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v15_0_0 = buildNodejs {
            enableNpm = true;
            version = "15.0.0";
            sha256 = "0yrlzxrqb5j0qyj4qgzfxyvvd7c76hpslkiswj3cjcq70qbql4zn";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_17_0 = buildNodejs {
            enableNpm = true;
            version = "14.17.0";
            sha256 = "1vf989canwcx0wdpngvkbz2x232yccp7fzs1vcbr60rijgzmpq2n";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_16_1 = buildNodejs {
            enableNpm = true;
            version = "14.16.1";
            sha256 = "1hxsk83g2plv6vv3ir1ngca0rwqdy3lq70r504d2qv3msszdnjp4";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_16_0 = buildNodejs {
            enableNpm = true;
            version = "14.16.0";
            sha256 = "19nz2mhmn6ikahxqyna1dn25pb5v3z9vsz9zb2flb6zp2yk4hxjf";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_15_5 = buildNodejs {
            enableNpm = true;
            version = "14.15.5";
            sha256 = "0nv576mlmnf8pfs6yn7vsvwyg0a0xvs7m9pm4k131zjqx501v6z1";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_15_4 = buildNodejs {
            enableNpm = true;
            version = "14.15.4";
            sha256 = "177cxp4fhmglyx035j8smiy1bp5fz6q2phlcl0a2mdbldkvfrdxd";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_15_3 = buildNodejs {
            enableNpm = true;
            version = "14.15.3";
            sha256 = "1zplrfhsrqblvq2wxf5386wc9hf11k42jaw4mzgwy5dxx6dv3krj";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_15_2 = buildNodejs {
            enableNpm = true;
            version = "14.15.2";
            sha256 = "1076v19sxsfbccwdqg559bs86vr875axi5nhnskz57lngwkdyag0";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_15_1 = buildNodejs {
            enableNpm = true;
            version = "14.15.1";
            sha256 = "1g61vqsgq3jsipw2fckj68i4a4pi1iz1kbw7mlw8jmzp8rl46q81";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_15_0 = buildNodejs {
            enableNpm = true;
            version = "14.15.0";
            sha256 = "0fzv05f8rnc0s1a11k0cqfpgv9yawfbdd8qcl8zr25kv5ridhdip";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_14_0 = buildNodejs {
            enableNpm = true;
            version = "14.14.0";
            sha256 = "1rphkl3lqg0rzgg0r58bfv1hjw3rg96qvqcilk2927kbpps3bs84";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_13_1 = buildNodejs {
            enableNpm = true;
            version = "14.13.1";
            sha256 = "1xhmdhzsk3pfl4k8l0ipd9a1v5z807sl65mwkw51y7lc44gbsqb0";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_13_0 = buildNodejs {
            enableNpm = true;
            version = "14.13.0";
            sha256 = "1r06xnf4i5bkq8pgc9y25yhkm787xi3igay883w0a45l83abxfg0";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_12_0 = buildNodejs {
            enableNpm = true;
            version = "14.12.0";
            sha256 = "0c2mv208akyk10pmjfilxbdpi2gpb5zlb4h903lgqmr229kmnd3c";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_11_0 = buildNodejs {
            enableNpm = true;
            version = "14.11.0";
            sha256 = "1sq5j9fpcj0sb9062fik35chkc3lgdbwj56fcza186qsfzrf9iji";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_10_1 = buildNodejs {
            enableNpm = true;
            version = "14.10.1";
            sha256 = "1dymx9j3g6wbbdmw6083yg49ydxwfl2fgy9i8jxpngnskvwq4lrb";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_10_0 = buildNodejs {
            enableNpm = true;
            version = "14.10.0";
            sha256 = "00f7p2l3wpj12r6bxz7l6cxkipwl6in4qlzxrzkk0z81k32ph6s3";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_9_0 = buildNodejs {
            enableNpm = true;
            version = "14.9.0";
            sha256 = "1xkfivr0qci50ksg66szyasdlbiwh2j7ia4n6qc5csih2nvzcbh1";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_8_0 = buildNodejs {
            enableNpm = true;
            version = "14.8.0";
            sha256 = "0vghz7g7mih7idgknwzdc2zfw82qqq497m727ydhkas1wvj6i7lv";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_7_0 = buildNodejs {
            enableNpm = true;
            version = "14.7.0";
            sha256 = "0vwf523ahw0145wp17zkaflwm5823v1vz1kkglj25gzjydiiqbya";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_6_0 = buildNodejs {
            enableNpm = true;
            version = "14.6.0";
            sha256 = "153a07ffrmvwbsc78wrc0xnwymmzrhva0kn6mgnfi3086v3h1wss";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_5_0 = buildNodejs {
            enableNpm = true;
            version = "14.5.0";
            sha256 = "1d6w7ycdiqbkip7m6m8xly31qgx7ywakzvrnqdq8ini5sricjlgb";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_4_0 = buildNodejs {
            enableNpm = true;
            version = "14.4.0";
            sha256 = "1fbx1r3fflpsy0s7zknca0xyv2gg0ff5fl8czzsb79imqjlgcy0x";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_3_0 = buildNodejs {
            enableNpm = true;
            version = "14.3.0";
            sha256 = "0xqs9z0pxx8m5dk9gm1r9pxfk9vdmpvfsj94mfdkqar578nfm8gi";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_2_0 = buildNodejs {
            enableNpm = true;
            version = "14.2.0";
            sha256 = "1kqnkqkv2chw9s0hazbaba5y1555h526825xqk4rr441wcxcrzcf";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v14_1_0 = buildNodejs {
            enableNpm = true;
            version = "14.1.0";
            sha256 = "0pw39628y8qi2jagmmnfj0fkcbv00qcd1cqybiprf1v22hhij44n";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_14_0 = buildNodejs {
            enableNpm = true;
            version = "13.14.0";
            sha256 = "1gi9nl99wsiqpwm266jdsa8g6rmjw4wqwgrkx9f2qk1y3hjcs0vf";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_13_0 = buildNodejs {
            enableNpm = true;
            version = "13.13.0";
            sha256 = "0wy7d2alli59gwl73hpaf3bz1wxkkcw5yjsgyz42695fz86p64b7";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_12_0 = buildNodejs {
            enableNpm = true;
            version = "13.12.0";
            sha256 = "199qcvzikdzw0h25v9dws77fff6hbvr8dj50lyzlnkya1dd6fzhd";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_11_0 = buildNodejs {
            enableNpm = true;
            version = "13.11.0";
            sha256 = "07r9xwjmiip9zmgfq77f3av3p93adc5cphj07idph1l8ws1j2h75";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_10_1 = buildNodejs {
            enableNpm = true;
            version = "13.10.1";
            sha256 = "14pvqwhilq210zn830zmh04a62rj3si0ijc4ihrhdf3dvghrx2c3";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_10_0 = buildNodejs {
            enableNpm = true;
            version = "13.10.0";
            sha256 = "11m8sisi3dmr70fpnb7xi6nljil3rm36liz0wfzd7kgxmv6p9mhj";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_9_0 = buildNodejs {
            enableNpm = true;
            version = "13.9.0";
            sha256 = "0z68hj3z2y8aj4bc14h77mj5l99jb4ljjc10gp0dpg8s4g1x5xzw";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_8_0 = buildNodejs {
            enableNpm = true;
            version = "13.8.0";
            sha256 = "1h437yvg43xci35rvp55gvb94rddkf4j9i9iw81bmkwhvb4h8qdv";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_7_0 = buildNodejs {
            enableNpm = true;
            version = "13.7.0";
            sha256 = "1fql5858aqny8krrqrgdp97kfia8xv0jlviwnm3akmv8i1i6xqkh";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_6_0 = buildNodejs {
            enableNpm = true;
            version = "13.6.0";
            sha256 = "0jf9nn5i1bijmrcgjvkp37fyz63lwwmxjh7nxipn2vw2qdx6ngsm";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_5_0 = buildNodejs {
            enableNpm = true;
            version = "13.5.0";
            sha256 = "1ng959fm8ls222mmn2vpkw4n4jba02qigpxc8p85jxfj36dsq4ak";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_4_0 = buildNodejs {
            enableNpm = true;
            version = "13.4.0";
            sha256 = "17fbb9j49g0nnp3vlz1pzcwshzhb0mzhfnly4xgfmkq2sxr123xb";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_3_0 = buildNodejs {
            enableNpm = true;
            version = "13.3.0";
            sha256 = "0j36jf0ybq470w91kzg28bcmxlml7ccl4swwklb6x1ibkz697np7";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_2_0 = buildNodejs {
            enableNpm = true;
            version = "13.2.0";
            sha256 = "0r0bbwnp77njhdmby7cs2g6yxfprri684s8h3gqq95ks7vgwgvhx";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_1_0 = buildNodejs {
            enableNpm = true;
            version = "13.1.0";
            sha256 = "0s6b2k7i89j9mxwyz271fvm6bf8jcz2v5kzmn0v5icrkpmn0ab6l";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_0_1 = buildNodejs {
            enableNpm = true;
            version = "13.0.1";
            sha256 = "1n9w1kvdzdg2j0a41wdkqcl893209lc018sd49xpy1cnr169h6vr";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
          v13_0_0 = buildNodejs {
            enableNpm = true;
            version = "13.0.0";
            sha256 = "0rs7qxmk17q114pg7l1k1dzk0vq4z9fhy773cbyr7z63mx03pzs5";
            patches = lib.optional stdenv.isDarwin "${nixpkgs}/pkgs/development/web/nodejs/./bypass-xcodebuild.diff";
          };
        in rec {
          "23" = v23_3_0.overrideAttrs (prev: {
            passthru = {
              "3"."0" = v23_3_0;
              "2"."1" = v23_2_1;
              "2"."0" = v23_2_0;
              "1"."1" = v23_1_1;
              "1"."0" = v23_1_0;
              "0"."0" = v23_0_0;
            };
          });
          "22" = v22_5_0.overrideAttrs (prev: {
            passthru = {
              "5"."0" = v22_5_0;
              "4"."0" = v22_4_0;
              "3"."1" = v22_3_1;
              "3"."0" = v22_3_0;
              "2"."0" = v22_2_0;
              "1"."0" = v22_1_0;
              "0"."0" = v22_0_0;
            };
          });
          "21" = v21_6_2.overrideAttrs (prev: {
            passthru = {
              "6"."2" = v21_6_2;
              "6"."1" = v21_6_1;
              "6"."0" = v21_6_0;
              "5"."0" = v21_5_0;
              "4"."0" = v21_4_0;
              "3"."0" = v21_3_0;
              "2"."0" = v21_2_0;
              "1"."0" = v21_1_0;
              "0"."0" = v21_0_0;
            };
          });
          "20" = v20_8_0.overrideAttrs (prev: {
            passthru = {
              "8"."0" = v20_8_0;
              "7"."0" = v20_7_0;
              "6"."1" = v20_6_1;
              "6"."0" = v20_6_0;
              "5"."1" = v20_5_1;
              "5"."0" = v20_5_0;
              "4"."0" = v20_4_0;
              "3"."1" = v20_3_1;
              "3"."0" = v20_3_0;
              "2"."0" = v20_2_0;
              "1"."0" = v20_1_0;
              "0"."0" = v20_0_0;
            };
          });
          "16" = v16_3_0.overrideAttrs (prev: {
            passthru = {
              "3"."0" = v16_3_0;
              "2"."0" = v16_2_0;
              "1"."0" = v16_1_0;
              "0"."0" = v16_0_0;
            };
          });
          "15" = v15_14_0.overrideAttrs (prev: {
            passthru = {
              "14"."0" = v15_14_0;
              "13"."0" = v15_13_0;
              "12"."0" = v15_12_0;
              "11"."0" = v15_11_0;
              "10"."0" = v15_10_0;
              "9"."0" = v15_9_0;
              "8"."0" = v15_8_0;
              "7"."0" = v15_7_0;
              "6"."0" = v15_6_0;
              "5"."1" = v15_5_1;
              "5"."0" = v15_5_0;
              "4"."0" = v15_4_0;
              "3"."0" = v15_3_0;
              "2"."1" = v15_2_1;
              "2"."0" = v15_2_0;
              "1"."0" = v15_1_0;
              "0"."1" = v15_0_1;
              "0"."0" = v15_0_0;
            };
          });
          "14" = v14_17_0.overrideAttrs (prev: {
            passthru = {
              "17"."0" = v14_17_0;
              "16"."1" = v14_16_1;
              "16"."0" = v14_16_0;
              "15"."5" = v14_15_5;
              "15"."4" = v14_15_4;
              "15"."3" = v14_15_3;
              "15"."2" = v14_15_2;
              "15"."1" = v14_15_1;
              "15"."0" = v14_15_0;
              "14"."0" = v14_14_0;
              "13"."1" = v14_13_1;
              "13"."0" = v14_13_0;
              "12"."0" = v14_12_0;
              "11"."0" = v14_11_0;
              "10"."1" = v14_10_1;
              "10"."0" = v14_10_0;
              "9"."0" = v14_9_0;
              "8"."0" = v14_8_0;
              "7"."0" = v14_7_0;
              "6"."0" = v14_6_0;
              "5"."0" = v14_5_0;
              "4"."0" = v14_4_0;
              "3"."0" = v14_3_0;
              "2"."0" = v14_2_0;
              "1"."0" = v14_1_0;
            };
          });
          "13" = v13_14_0.overrideAttrs (prev: {
            passthru = {
              "14"."0" = v13_14_0;
              "13"."0" = v13_13_0;
              "12"."0" = v13_12_0;
              "11"."0" = v13_11_0;
              "10"."1" = v13_10_1;
              "10"."0" = v13_10_0;
              "9"."0" = v13_9_0;
              "8"."0" = v13_8_0;
              "7"."0" = v13_7_0;
              "6"."0" = v13_6_0;
              "5"."0" = v13_5_0;
              "4"."0" = v13_4_0;
              "3"."0" = v13_3_0;
              "2"."0" = v13_2_0;
              "1"."0" = v13_1_0;
              "0"."1" = v13_0_1;
              "0"."0" = v13_0_0;
            };
          });
        };
      });
}
