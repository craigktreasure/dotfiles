#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing Visual Studio Code...' -ForegroundColor Magenta

$wingetId = 'Microsoft.VisualStudioCode'

if (Test-WingetInstalledById $wingetId) {
    Write-Host 'Already installed.'
    return
}

winget install --id=$wingetId --exact
