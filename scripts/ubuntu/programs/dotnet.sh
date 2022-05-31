#!/bin/bash -e

# https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu

echo "Installing .NET 6.0"

# Update the list of packages
sudo apt-get update

# Download the Microsoft repository GPG keys
OS_RELEASE=$(lsb_release -rs)
MS_REPOSITORY_URL="https://packages.microsoft.com/config/ubuntu/$OS_RELEASE/packages-microsoft-prod.deb"
wget -q $MS_REPOSITORY_URL -O ~/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
sudo dpkg -i ~/packages-microsoft-prod.deb

# Cleanup the deb package
rm ~/packages-microsoft-prod.deb

sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0