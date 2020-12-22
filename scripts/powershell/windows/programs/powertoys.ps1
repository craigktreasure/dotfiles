#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing PowerToys...'

if ($IsArm64) {
    Write-Warning 'Not available on ARM64.'
    return
}

winget install --id=Microsoft.PowerToys --exact
