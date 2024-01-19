# UNTESTED: NOT YET USED

$devDrivePath = 'D:\'

function ConfigurePackagePath([string] $name, [string] $value) {
    [Environment]::SetEnvironmentVariable($name, $value, 'User')
}

# Format-Volume -DriveLetter D -DevDrive

ConfigurePackagePath 'npm_config_cache' (Join-Path $devDrivePath '.packages\npm')
ConfigurePackagePath 'NUGET_PACKAGES' (Join-Path $devDrivePath '.packages\nuget')
ConfigurePackagePath 'VCPKG_DEFAULT_BINARY_CACHE' (Join-Path $devDrivePath '.packages\vcpkg')
ConfigurePackagePath 'PIP_CACHE_DIR' (Join-Path $devDrivePath '.packages\pip')
ConfigurePackagePath 'CARGO_HOME' (Join-Path $devDrivePath '.packages\cargo')
$mavenPackagePath = Join-Path $devDrivePath '.packages\maven'
ConfigurePackagePath 'MAVEN_OPTS' "-Dmaven.repo.local=$mavenPackagePath %MAVEN_OPTS%"
