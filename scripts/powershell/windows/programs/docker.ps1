#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '..' 'windows-variables.ps1')
. (Join-Path $PSScriptRoot '..' 'winget-helpers.ps1')

Write-Host 'Installing Docker Desktop...' -ForegroundColor Magenta

$wingetId = 'Docker.DockerDesktop'

if ($script:IsVirtualMachine) {
    Write-Warning 'Skipping for virtual machine.'
    return
}

if (Test-WingetInstalledById $wingetId) {
    Write-Host 'Already installed.'
    return
}

winget install --id=$wingetId --exact --interactive
