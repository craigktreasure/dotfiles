function Test-WingetInstalledByName([string] $name) {
    & winget list --name $name --exact

    return $LASTEXITCODE -eq 0
}