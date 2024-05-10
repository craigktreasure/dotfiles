#!/bin/bash -e

# Get the Ubuntu version
version=$(lsb_release -rs)

# Check if the version is greater than or equal to 24.04
if [ $(echo "$version 24.04" | awk '{print ($1 >= $2)}') -ne 0 ]; then
    # Call the script for Ubuntu 24.04 or greater
    ./dotnet.post24.sh
else
    # Call the script for versions less than Ubuntu 24.04
    ./dotnet.pre24.sh
fi
