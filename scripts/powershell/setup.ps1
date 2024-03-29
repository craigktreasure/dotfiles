#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Starting configuration from PowerShell...' -ForegroundColor Green

. (Join-Path $PSScriptRoot 'variables.ps1')

. (Join-Path $PSScriptRoot 'configure.ps1')

if ($IsLinux) {
    . (Join-Path $PSScriptRoot 'linux' 'setup-linux.ps1')
} elseif ($IsWindows) {
    . (Join-Path $PSScriptRoot 'windows' 'setup-windows.ps1')
}

. (Join-Path $PSScriptRoot 'common' 'programs' 'dotnet-tools.ps1')
. (Join-Path $PSScriptRoot 'common' 'programs' 'azure-artifact-credential-provider.ps1')

Write-Host 'Configuration from PowerShell complete.' -ForegroundColor Green
