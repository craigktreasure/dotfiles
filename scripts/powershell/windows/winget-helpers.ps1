function Test-WingetInstalledById([string] $Id) {
    & winget list --id $id --exact

    return $LASTEXITCODE -eq 0
}

function Test-WingetInstalledByIdLike([string] $Id) {
    & winget list --id $id

    return $LASTEXITCODE -eq 0
}

function Test-WingetInstalledByName([string] $name) {
    & winget list --name $name --exact

    return $LASTEXITCODE -eq 0
}
