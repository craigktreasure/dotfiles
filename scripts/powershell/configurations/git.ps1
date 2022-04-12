#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

# Configure Git profile
Write-Host 'Configuring Git profile...' -ForegroundColor Magenta

$isNotDomainJoined = $env:COMPUTERNAME -eq $env:USERDOMAIN

git config --global init.defaultbranch main
git config --global user.name 'Craig Treasure'

if ($isNotDomainJoined) {
    git config --global user.email 'craigktreasure@outlook.com'
}

git config --global fetch.prune true
git config --global pull.rebase true

if ($IsWsl) {
    git config --global core.editor "code --wait"
    # https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/wsl.md
    git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
    git config --global credential.https://dev.azure.com.usehttppath true
} elseif ($IsLinux) {
    git config --global core.editor nano
} elseif ($IsWindows) {
    git config --global core.editor notepad
    git config --global core.autocrlf true
} elseif ($IsMacOS) {
    git config --global core.editor "code --wait"
}

git lfs install
