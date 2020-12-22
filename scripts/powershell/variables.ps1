#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Initializing system variables...' -ForegroundColor Green

if ($IsLinux) {
    . (Join-Path $PSScriptRoot 'linux' 'linux-variables.ps1')
} elseif ($IsWindows) {
    . (Join-Path $PSScriptRoot 'windows' 'windows-variables.ps1')
}
