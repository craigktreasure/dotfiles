#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot 'windows-variables.ps1')
Import-Module (Join-Path $PSScriptRoot '..' 'modules' 'common' 'common.psm1') -DisableNameChecking

Write-Host 'Setting up Windows...' -ForegroundColor Magenta

. (Join-Path $PSScriptRoot 'install-apps.ps1')
. (Join-Path $PSScriptRoot 'configure-windows.ps1')

Write-Host 'Finished setting up Windows.' -ForegroundColor Green
