#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Installing PowerShell modules...' -ForegroundColor Magenta

Install-Module PSReadLine -Force

if (-not (Get-InstalledModule -Name posh-git -ErrorAction SilentlyContinue)) {
    PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
} else {
    Write-Host 'posh-git already installed.' -ForegroundColor Yellow
}
