#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

function Get-IsDomainJoined {
    if ($IsWsl) {
        $computerName = wslvar COMPUTERNAME
        $domain = wslvar USERDOMAIN

        return $computerName -ne $domain
    } elseif ($IsWindows) {
        return $env:COMPUTERNAME -ne $env:USERDOMAIN
    }

    return $false
}

# Configure Git profile
Write-Host 'Configuring Git profile...' -ForegroundColor Magenta

git config --global init.defaultbranch main
git config --global user.name 'Craig Treasure'

$isDomainJoined = Get-IsDomainJoined

if ($isDomainJoined) {
    Write-Host 'Make sure to configure the git email: git config --global user.email <email>' -ForegroundColor Yellow
}
else {
    git config --global user.email 'craigktreasure@outlook.com'
}

git config --global fetch.prune true
git config --global pull.rebase true

if ($IsWsl) {
    git config --global core.editor "code --wait"
    # https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/wsl.md
    git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"
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
