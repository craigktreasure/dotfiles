#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

# Setup Scoop aliases
scoop alias add upc 'scoop update *;scoop cleanup *' 'Update and clean old versions of all installed apps'
