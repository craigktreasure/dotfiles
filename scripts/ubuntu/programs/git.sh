#!/bin/bash -e

# https://itsfoss.com/install-git-ubuntu/
# https://github.com/git-lfs/git-lfs/wiki/Installation

echo "Installing the latest version of git and git-lfs..."

# Configure latest Git repo
sudo add-apt-repository ppa:git-core/ppa -y

# Configure latest Git LFS repo
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

sudo apt update
sudo apt install -y git git-lfs
