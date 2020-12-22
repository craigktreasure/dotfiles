#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

if (Test-Path variable:\OSRelease) {
    return
}

if (Test-Path '/etc/os-release') {
    $script:OSRelease = Get-Content /etc/os-release | ConvertFrom-StringData
}

$script:IsUbuntu = ($OSRelease.ID -eq 'ubuntu')

# https://github.com/microsoft/WSL/issues/423
$script:IsWsl = $IsLinux -and ((Get-Content /proc/sys/kernel/osrelease) -like '*WSL2*' -or (Test-Path /run/WSL/))
