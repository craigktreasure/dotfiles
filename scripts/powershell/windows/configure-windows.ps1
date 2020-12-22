#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Configuring Windows...'

Write-Host 'Enabling LongPaths support in Windows'
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
