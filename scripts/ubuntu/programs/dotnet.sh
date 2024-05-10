#!/bin/bash -e

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
SCRIPT_DIR=$( dirname $SCRIPT_PATH )

# Get the Ubuntu version
version=$(lsb_release -rs)

# Check if the version is greater than or equal to 24.04
if [ $(echo "$version 24.04" | awk '{print ($1 >= $2)}') -ne 0 ]; then
    # Call the script for Ubuntu 24.04 or greater
    . $SCRIPT_DIR/dotnet.post24.sh
else
    # Call the script for versions less than Ubuntu 24.04
    . $SCRIPT_DIR/dotnet.pre24.sh
fi
