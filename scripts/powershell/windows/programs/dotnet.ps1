#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing .NET 8 SDK...' -ForegroundColor Magenta
Install-WingetPackageById 'Microsoft.DotNet.SDK.8'

Write-Host 'Installing .NET 9 SDK...' -ForegroundColor Magenta
Install-WingetPackageById 'Microsoft.DotNet.SDK.9'
