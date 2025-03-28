function Test-CommandExists {

    Param(
        [Parameter(Mandatory = $true)]
        [string]$Command
    )

    if (Get-Command $Command -ErrorAction SilentlyContinue) {
        return $true
    }

    return $false
}
Export-ModuleMember -Function Test-CommandExists

# https://github.com/actions/virtual-environments/blob/main/images/win/scripts/ImageHelpers/InstallHelpers.ps1#L156
function Start-DownloadWithRetry
{
    Param
    (
        [Parameter(Mandatory)]
        [string] $Url,
        [string] $Name,
        [string] $DownloadPath = "${env:Temp}",
        [int] $Retries = 20
    )

    if ([String]::IsNullOrEmpty($Name)) {
        $Name = [IO.Path]::GetFileName($Url)
    }

    $filePath = Join-Path -Path $DownloadPath -ChildPath $Name

    #Default retry logic for the package.
    while ($Retries -gt 0)
    {
        try
        {
            Write-Host "Downloading package from: $Url to path $filePath ."
            (New-Object System.Net.WebClient).DownloadFile($Url, $filePath)
            break
        }
        catch
        {
            Write-Host "There is an error during package downloading:`n $_"
            $Retries--

            if ($Retries -eq 0)
            {
                Write-Host "File can't be downloaded. Please try later or check that file exists by url: $Url"
                exit 1
            }

            Write-Host "Waiting 30 seconds before retrying. Retries left: $Retries"
            Start-Sleep -Seconds 30
        }
    }

    return $filePath
}
Export-ModuleMember -Function Start-DownloadWithRetry

function Test-EnvPathContainsPath {
    param (
        [string]$PathToCheck
    )

    # Check if the path is already in the PATH environment variable
    $pathsInPath = $env:PATH -split [System.IO.Path]::PathSeparator |
        ForEach-Object { $_.TrimEnd(([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)) }

    # Perform a case-insensitive comparison
    foreach ($path in $pathsInPath) {
        if ($path -ieq $PathToCheck) {
            return $true
        }
    }
}
Export-ModuleMember -Function Test-EnvPathContainsPath

function Append-ToPath {

    Param(
        [string]$PathToAdd
    )

    # Check if the path is already in the PATH environment variable
    if (Test-EnvPathContainsPath -PathToCheck $PathToAdd) {
        return
    }

    $env:Path += "$([System.IO.Path]::PathSeparator)$PathToAdd"
}
Export-ModuleMember -Function Append-ToPath
