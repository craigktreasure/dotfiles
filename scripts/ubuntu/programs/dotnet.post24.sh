#!/bin/bash -e

# https://docs.microsoft.com/dotnet/core/install/linux-ubuntu

echo "Installing .NET 6 and 8"

# Register the backports package repository
# https://learn.microsoft.com/dotnet/core/install/linux-ubuntu#register-the-ubuntu-net-backports-package-repository
sudo add-apt-repository ppa:dotnet/backports -y

sudo apt-get update; \
  sudo apt-get install -y dotnet-sdk-6.0 dotnet-sdk-8.0