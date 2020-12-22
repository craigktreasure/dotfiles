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
