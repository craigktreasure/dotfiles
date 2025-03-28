function Install-WingetPackageById([string] $wingetId, [switch] $silent = $false) {
    $wingetArgs = @(
        'install'
        '--id'
        $wingetId
        '--exact'
    )

    if ($silent) {
        $wingetArgs += '--silent'
    } else {
        $wingetArgs += '--interactive'
    }

    winget @wingetArgs
}

function Test-WingetInstalledById([string] $id) {
    & winget list --id $id --exact | Out-Null

    return $LASTEXITCODE -eq 0
}

function Test-WingetInstalledByIdLike([string] $id) {
    & winget list --id $id | Out-Null

    return $LASTEXITCODE -eq 0
}

function Test-WingetInstalledByName([string] $name) {
    & winget list --name $name --exact | Out-Null

    return $LASTEXITCODE -eq 0
}
