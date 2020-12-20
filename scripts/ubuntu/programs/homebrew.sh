#!/bin/bash -e

if ! command -v brew; then
    echo "Installing Homebrew..."
    
    sudo apt-get install -y build-essential
    
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" </dev/null
    echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.profile
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    brew --version
else
    echo "Already installed: Homebrew"
fi
