#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot '../variables.ps1')

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

# https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/wsl.md
function Get-GitCredentialManagerCorePath {
    $location = "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
    if (Test-Path $location) {
        return $location
    }

    $locations = @(Get-ChildItem -Path '/mnt/c/Program Files/Git' -Recurse -Filter git-credential-manager.exe)

    if ($locations.Count -eq 0) {
        return $null
    }

    Return ($locations[0] | Select-Object -ExpandProperty FullName) -replace ' ','\ '
}

function Set-GitCredentialManagerCoreConfiguration {
    $gcmcPath = Get-GitCredentialManagerCorePath

    if (-not $gcmcPath) {
        Write-Warning 'Unable to locate git-credential-manager.exe. Git credential manager will need to be configured manually.'
        return
    }

    git config --global credential.helper $gcmcPath
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
    git config --global user.email 'craigktreasure@gmail.com'
}

git config --global fetch.prune true
git config --global pull.rebase true
git config --global core.fsmonitor true

if ($IsWsl) {
    git config --global core.editor "code --wait"
    Set-GitCredentialManagerCoreConfiguration
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
