#Requires -PSEdition Core

Set-StrictMode -Version 1.0
$ErrorActionPreference = "Stop"

if ($IsLinux) {
    . (Join-Path $PSScriptRoot '..' 'linux' 'linux-variables.ps1')
}

# Configure Git profile
Write-Host 'Configuring Git profile...' -ForegroundColor Magenta

git config --global init.defaultbranch main
git config --global user.name 'Craig Treasure'
git config --global user.email 'craigktreasure@outlook.com'
git config --global fetch.prune true
git config --global pull.rebase true

if ($IsWsl) {
    git config --global core.editor "code --wait"
    git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
} elseif ($IsLinux) {
    git config --global core.editor nano
} elseif ($IsWindows) {
    git config --global core.editor notepad
    git config --global core.autocrlf true
} elseif ($IsMacOS) {
    git config --global core.editor "code --wait"
}

git lfs install
