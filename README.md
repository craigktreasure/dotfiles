# My dotfiles

## Machine setup

My setup scripts use a combination of the native scripting language and PowerShell. I rely heavily on PowerShell because
it is cross-platform and I'm more comfortable with it. I use the native scripting languages to bootstrap the initial
set of steps and tools and to install PowerShell for the remaining steps.

### Ubuntu

To setup an Ubuntu machine, simply run:

```bash
mkdir ~/repos && git clone https://github.com/craigktreasure/dotfiles.git ~/repos/dotfiles && ~/repos/dotfiles/scripts/setup-ubuntu.sh
```

When the script is run from WSL, the Git credential manager is configured to use the credential manager from Windows.

ToDo:

* Install Git Credential Manager Core for non-WSL installs.

### Windows

#### Prerequisites

The instructions here assume Windows 11.

Windows doesn't come with as much of the necessary tooling, so we need a few prerequisites:

* Update Windows by running **Windows Update**.
* Update apps in the **Microsoft Store**.
* [Git](https://git-scm.com/)
  * Download from [here](https://git-scm.com/) or install using **winget**: `winget install --name Git --interactive`.
  * Recommended options:
    * Check daily for Git for Windows updates
    * Select other editor as Git's default editor: `notepad`.
    * Override the default branch name for new repositories: `main`.
    * Git Credential Manager Core
    * Enable file system caching
    * Enable symbolic links
  * Restart your shell.
* [PowerShell](https://docs.microsoft.com/powershell/scripting/install/installing-powershell-on-windows)
  * Install from the [**Microsoft Store**](https://www.microsoft.com/p/powershell/9mz1snwt0n5d).
    * Or, install using **winget**: `winget install --name PowerShell --id 9MZ1SNWT0N5D --source msstore`.
  * Or, download from [here](https://github.com/powershell/powershell).
    * Or, install using **winget**: `winget install --id Microsoft.PowerShell --interactive`.

#### Automatic setup

Run the following from [PowerShell](https://github.com/powershell/powershell):

```powershell
mkdir "$HOME/repos"; git clone https://github.com/craigktreasure/dotfiles.git "$HOME/repos/dotfiles"; & "$HOME/repos/dotfiles/scripts/setup-windows.ps1"
```
