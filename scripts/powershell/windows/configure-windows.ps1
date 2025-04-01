#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

Write-Host 'Configuring Windows...'

function EnableLongPathsSupport {
    $registryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem'
    $propertyName = 'LongPathsEnabled'

    if (Test-Path $registryPath) {
        $currentValue = Get-ItemProperty -Path $registryPath -Name $propertyName -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty $propertyName -ErrorAction SilentlyContinue
        if ($currentValue -ne 1) {
            Write-Host 'Enabling LongPaths support in Windows'

            sudo Set-ItemProperty -Path $registryPath -Name $propertyName -Value 1
            Write-Host "Enabled."
        } else {
            Write-Host "LongPaths support already enabled."
        }
    } else {
        throw "Registry path $registryPath does not exist."
    }
}

EnableLongPathsSupport
