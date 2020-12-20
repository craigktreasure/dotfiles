#!/bin/bash -e

sudo apt-get update

echo "Installing basic apt packages..."

sudo apt-get install -y curl wget file htop nmap
sudo apt-get install -y p7zip-full p7zip-rar
sudo apt-get install -y build-essential

INSTALL_APPS_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
SCRIPTS_UBUNTU_DIR=$( dirname $INSTALL_APPS_SCRIPT_PATH )

echo "Intalling packages that require new package sources and other configuration..."

. $SCRIPTS_UBUNTU_DIR/programs/git.sh
. $SCRIPTS_UBUNTU_DIR/programs/dotnet.sh
. $SCRIPTS_UBUNTU_DIR/programs/powershell.sh
. $SCRIPTS_UBUNTU_DIR/programs/homebrew.sh
. $SCRIPTS_UBUNTU_DIR/programs/rust.sh
. $SCRIPTS_UBUNTU_DIR/programs/speedtest-cli.sh

echo "Intalling Homebrew packages..."

. $SCRIPTS_UBUNTU_DIR/programs/cmake.sh
. $SCRIPTS_UBUNTU_DIR/programs/github-cli.sh
. $SCRIPTS_UBUNTU_DIR/programs/llvm.sh
