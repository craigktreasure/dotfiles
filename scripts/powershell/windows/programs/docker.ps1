#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing Docker Desktop...'

if ($IsVirtualMachine) {
    Write-Warning 'Skipping for virtual machine.'
    return
}

winget install --id=Docker.DockerDesktop --exact
