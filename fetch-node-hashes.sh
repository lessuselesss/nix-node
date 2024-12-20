#!/usr/bin/env bash

# Enable debug output
set -x

# Array of versions that need updating
VERSIONS=(
    "23.2.1"
    "22.5.0"
    "22.4.0"
    "22.3.1"
    "22.3.0"
    "22.2.0"
    "22.1.0"
    "22.0.0"
    "21.6.2"
    "21.6.1"
    "21.6.0"
    "21.5.0"
    "21.4.0"
    "21.3.0"
    "21.2.0"
    "21.1.0"
    "21.0.0"
)

# Get the directory of the script and ensure flake.nix path is absolute
FLAKE_PATH="$(pwd)/flake.nix"

echo "Looking for flake.nix at: $FLAKE_PATH"

# Verify flake.nix exists
if [ ! -f "$FLAKE_PATH" ]; then
    echo "Error: Cannot find flake.nix at ${FLAKE_PATH}"
    exit 1
fi

# Process each version
for version in "${VERSIONS[@]}"; do
    echo "Fetching hash for Node.js v${version}..."
    
    # Fetch the hash
    HASH=$(nix-prefetch-url "https://nodejs.org/dist/v${version}/node-v${version}.tar.gz" 2>/dev/null)
    
    if [ $? -eq 0 ] && [ ! -z "$HASH" ]; then
        echo "Got hash for v${version}: ${HASH}"
        
        # Replace the placeholder in the file
        if [ "$(uname)" == "Darwin" ]; then
            sed -i '' -e "s|sha256 = \"SHA256_PLACEHOLDER_FETCH\";|sha256 = \"${HASH}\";|g" "$FLAKE_PATH"
        else
            sed -i -e "s|sha256 = \"SHA256_PLACEHOLDER_FETCH\";|sha256 = \"${HASH}\";|g" "$FLAKE_PATH"
        fi
        
        # Verify the replacement
        if grep -q "$HASH" "$FLAKE_PATH"; then
            echo "Successfully updated hash for v${version}"
        else
            echo "Warning: Failed to update hash for v${version}"
        fi
    else
        echo "Failed to fetch hash for v${version}"
    fi
done

echo "Done updating hashes!" 