# UNTESTED: NOT YET USED

$devDrivePath = 'D:\'

Write-Host "Setting up DevDrive: $devDrivePath" -ForegroundColor Magenta

Write-Host 'Setting up DevDrive package caches' -ForegroundColor Magenta

function ConfigurePackagePath([string] $name, [string] $path, [string] $value) {
    if (-not $value) {
        $value = $path
    }

    Write-Host "Creating folder: $path"
    New-Item -Path $path -ItemType directory -Force | Out-Null
    Write-Host "Configurating cache environment variable: $name=$value"
    [Environment]::SetEnvironmentVariable($name, $value, 'User')
}

# Format-Volume -DriveLetter D -DevDrive

ConfigurePackagePath 'NPM_CONFIG_CACHE' (Join-Path $devDrivePath '.packages\npm')
ConfigurePackagePath 'NUGET_PACKAGES' (Join-Path $devDrivePath '.packages\nuget')
ConfigurePackagePath 'YARN_CACHE_FOLDER' (Join-Path $devDrivePath '.packages\yarn')
ConfigurePackagePath 'VCPKG_DEFAULT_BINARY_CACHE' (Join-Path $devDrivePath '.packages\vcpkg')
ConfigurePackagePath 'PIP_CACHE_DIR' (Join-Path $devDrivePath '.packages\pip')
ConfigurePackagePath 'CARGO_HOME' (Join-Path $devDrivePath '.packages\cargo')
$mavenPackagePath = Join-Path $devDrivePath '.packages\maven'
ConfigurePackagePath 'MAVEN_OPTS' $mavenPackagePath "-Dmaven.repo.local=$mavenPackagePath %MAVEN_OPTS%"
