#!/bin/bash -e

# https://www.speedtest.net/apps/cli
curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
sudo apt-get install -y speedtest
