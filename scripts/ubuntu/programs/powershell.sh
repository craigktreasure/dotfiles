#!/bin/bash -e

# https://learn.microsoft.com/powershell/scripting/install/install-ubuntu

echo "Installing PowerShell..."

# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common

# Download the Microsoft repository GPG keys
OS_RELEASE=$(lsb_release -rs)
MS_REPOSITORY_URL="https://packages.microsoft.com/config/ubuntu/$OS_RELEASE/packages-microsoft-prod.deb"
wget -q $MS_REPOSITORY_URL -O ~/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
sudo dpkg -i ~/packages-microsoft-prod.deb

# Cleanup the deb package
rm ~/packages-microsoft-prod.deb

# Update the list of products
sudo apt-get update

# Install PowerShell
sudo apt-get install -y powershell
