#!/bin/bash -e

echo "Upgrading existing packages..."

sudo apt update
sudo apt upgrade -y
