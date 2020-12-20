#!/bin/bash -e

echo "Installing LLVM..."

if ! command -v brew; then
    printf "Homebrew is not available.\n" >&2
    exit 1
fi

brew install llvm
