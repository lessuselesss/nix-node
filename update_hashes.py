#!/usr/bin/env python3
import re
import subprocess
import sys
from pathlib import Path

def get_hash_for_version(version):
    url = f"https://nodejs.org/dist/v{version}/node-v{version}.tar.gz"
    try:
        result = subprocess.run(
            ["nix-prefetch-url", url],
            capture_output=True,
            text=True,
            check=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Error fetching hash for version {version}: {e}")
        return None

def update_flake(file_path):
    content = Path(file_path).read_text()
    
    # Pattern to match version and sha256 entries
    pattern = r'v(\d+\.\d+\.\d+)\s*=\s*build\w*\s*{\s*enableNpm\s*=\s*true;\s*version\s*=\s*"([^"]+)";\s*sha256\s*=\s*"([^"]+)";'
    
    def replace_hash(match):
        full_match = match.group(0)
        version = match.group(2)
        old_hash = match.group(3)
        
        new_hash = get_hash_for_version(version)
        if new_hash and new_hash != old_hash:
            print(f"Updating version {version}: {old_hash} -> {new_hash}")
            return full_match.replace(old_hash, new_hash)
        return full_match

    new_content = re.sub(pattern, replace_hash, content)
    
    if new_content != content:
        Path(file_path).write_text(new_content)
        print("File updated successfully")
    else:
        print("No changes needed")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./update_hashes.py path/to/flake.nix")
        sys.exit(1)
    
    update_flake(sys.argv[1])