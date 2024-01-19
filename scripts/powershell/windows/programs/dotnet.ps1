#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing .NET 6 SDK...' -ForegroundColor Magenta
Install-WingetPackageById 'Microsoft.DotNet.SDK.6'

Write-Host 'Installing .NET 7 SDK...' -ForegroundColor Magenta
Install-WingetPackageById 'Microsoft.DotNet.SDK.7'

Write-Host 'Installing .NET 8 SDK...' -ForegroundColor Magenta
Install-WingetPackageById 'Microsoft.DotNet.SDK.8'
