#!/bin/bash -e

echo "Installing bat..."

# https://github.com/sharkdp/bat?tab=readme-ov-file#on-ubuntu-using-apt
sudo apt install bat

# Due to a collision with the bat command from another package, the default is batcat.
# Adding a link here from batcat to bat.
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
