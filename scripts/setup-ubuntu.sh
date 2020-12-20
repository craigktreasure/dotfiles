#!/bin/bash -e

SETUP_UBUNTU_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
SCRIPTS_DIR=$( dirname $SETUP_UBUNTU_SCRIPT_PATH )

. $SCRIPTS_DIR/ubuntu/update-all.sh
. $SCRIPTS_DIR/ubuntu/install-apps.sh

pwsh $SCRIPTS_DIR/powershell/setup.ps1

echo "Done!"
