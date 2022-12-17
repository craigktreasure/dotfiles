#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing .NET 6 SDK...' -ForegroundColor Magenta

$wingetId = 'Microsoft.DotNet.SDK.6'

if (-not (Test-WingetInstalledById $wingetId)) {
    winget install --id=$wingetId --exact  --interactive
}
else {
    Write-Host 'Already installed.'
}

Write-Host 'Installing .NET 7 SDK...' -ForegroundColor Magenta

$wingetId = 'Microsoft.DotNet.SDK.7'

if (Test-WingetInstalledById $wingetId) {
    winget install --id=$wingetId --exact --interactive
}
else {
    Write-Host 'Already installed.'
}
