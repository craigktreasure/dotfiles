#!/bin/bash -e

INSTALL_WSL_APPS_SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
SCRIPTS_UBUNTU_DIR=$( dirname $INSTALL_WSL_APPS_SCRIPT_PATH )

. $SCRIPTS_UBUNTU_DIR/programs/wslutilities.sh
