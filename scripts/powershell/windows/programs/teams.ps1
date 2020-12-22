#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing Teams...'

winget install --id=Microsoft.Teams --exact
