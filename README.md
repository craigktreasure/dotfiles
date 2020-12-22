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
* Install and configure the Azure credential provider.

### Windows

#### Prerequisites

Windows doesn't come with as much of the necessary tooling, so we need a few prerequisites:

* Update Windows by running **Windows Update**.
* [Windows Package Manager](https://docs.microsoft.com/windows/package-manager/winget/)
  * Install
    * Update **App Installer** from the Microsoft Store app.
      * This makes sure you have `winget` if it's available to you in the store.
    * If it's not available to you in the store, follow the instructions [here](https://github.com/microsoft/winget-cli).
  * Enable [Microsoft Store App support](https://github.com/microsoft/winget-cli/blob/master/doc/Settings.md#experimentalmsstore):
    * Run `winget settings` to open the settings file and add the following to the json object:

      ```json
          "experimentalFeatures": {
              "experimentalMSStore": true
          },
      ```

* [Git](https://git-scm.com/)
  * Download from [here](https://git-scm.com/) or install using `winget`: `winget install git -i`.
  * Recommended options:
    * Check daily for Git for Windows updates
    * Select other editor as Git's default editor: `notepad`.
    * Override the default branch name for new repositories: `main`.
    * Git Credential Manager Core
    * Enable file system caching
    * Enable symbolic links
  * Restart your shell.
* [PowerShell](https://github.com/powershell/powershell)
  * Download from [here](https://github.com/powershell/powershell) or install using `winget`: `winget install powershell -i`.

#### Automatic setup

Run the following from [PowerShell](https://github.com/powershell/powershell):

```powershell
mkdir "$HOME/repos"; git clone https://github.com/craigktreasure/dotfiles.git "$HOME/repos/dotfiles"; & "$HOME/repos/dotfiles/scripts/setup-windows.ps1"
```
