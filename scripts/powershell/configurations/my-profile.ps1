#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

$ProfileLocation = if ($env:HOME) {
   $env:HOME
}
elseif($env:USERPROFILE) {
   $env:USERPROFILE
}

# Clone my-profile
Write-Host 'Cloning my-profile repository...' -ForegroundColor Magenta

$MyProfileLocation = Join-Path $ProfileLocation 'repos' 'my-profile'

if (-not (Test-Path $MyProfileLocation)) {
    git clone https://github.com/craigktreasure/my-profile.git $MyProfileLocation
} else {
    Write-Host 'Already cloned.' -ForegroundColor Yellow
}

# Configure Git configuration to pull in things from my-profile
Write-Host 'Configuring Git profile with my-profile...' -ForegroundColor Magenta

git config --global include.path "$MyProfileLocation/Git/.gitconfig.aliases"
git config --global core.excludesfile "$MyProfileLocation/Git/.gitignore"

# Configure PowerShell profile from my-profile
Write-Host 'Configuring PowerShell profile with my-profile...' -ForegroundColor Magenta

if (-not (Test-Path -Path $profile.CurrentUserCurrentHost)) {
    new-item $PROFILE.CurrentUserCurrentHost -ItemType file -Force | Out-Null
    Copy-Item -Path (Join-Path $MyProfileLocation 'PowerShell' 'Microsoft.PowerShell_profile.ps1') `
              -Destination $PROFILE.CurrentUserCurrentHost -Force
}

Write-Host 'Done configuring my-profile.' -ForegroundColor Magenta
