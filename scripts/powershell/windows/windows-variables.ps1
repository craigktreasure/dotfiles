#Requires -PSEdition Core

$ErrorActionPreference = "Stop"

if (Test-Path variable:\WindowsVariablesInitialized) {
    return
}

$osArchitecture = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture

$script:IsArm64 = $osArchitecture -eq 'Arm64'
$script:IsVirtualMachine = powershell -NoProfile -Command "((Get-WmiObject win32_computersystem).model -eq 'VMware Virtual Platform' -or ((Get-WmiObject win32_computersystem).model -eq 'Virtual Machine'))"
$script:IsWsl = $false

$script:WindowsVariablesInitialized = $true
