#!/bin/bash -e

# https://learn.microsoft.com/powershell/scripting/install/install-ubuntu

echo "Installing PowerShell..."

# Get the Ubuntu version
version=$(lsb_release -rs)

# Check if the version is greater than or equal to 24.04
if [ $(echo "$version 24.04" | awk '{print ($1 >= $2)}') -ne 0 ]; then
    # Installation method for Ubuntu 24.04 or greater

    # https://github.com/PowerShell/PowerShell/issues/21385
    # Using snap as an alternative
    sudo snap install powershell --classic
else
    # Installation method for the script for versions less than Ubuntu 24.04

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
fi
