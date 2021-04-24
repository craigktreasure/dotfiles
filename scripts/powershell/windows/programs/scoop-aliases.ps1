#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

# Setup Scoop aliases
scoop alias add scorch 'scoop cache rm *' 'Remove everything from the cache'
scoop alias add upc 'scoop update *;scoop cleanup *' 'Update and clean old versions of all installed apps'
