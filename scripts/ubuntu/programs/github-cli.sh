#!/bin/bash -e

echo "Installing GitHub CLI..."

if ! command -v brew; then
    printf "Homebrew is not available.\n" >&2
    exit 1
fi

# https://github.com/cli/cli
brew install gh
