#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing Sysinternals...'

if (Test-WingetInstalledByName 'Sysinternals Suite') {
    Write-Host 'Already installed.'
}
else {
    winget install --name 'Sysinternals Suite' --exact
}
