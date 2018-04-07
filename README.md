# Term

There are many like it, but this one is mine.

![screenshot](screenshot.png)

## Font

I use [input](http://input.fontbureau.com/). Their license prohibits me from redistributing my customizations, but I can show the settings I used on their download page:

![input download settings](input.png)

## Terminal colours

I use the [base16](https://github.com/chriskempson/base16-gnome-terminal) tomorrow dark colour theme in gnome terminal.

### Workarounds for debian (and potentially debian derivatives)

1. You need to install some tools that are used by the shellscripts for installing the theme: `sudo apt-get install uuid-runtime dconf-cli`
1. Create a profile called "Default", and switch to it as the default. This profile needs to be present for the installation script to work, for some reason. You can delete it afterwards.

### Installation

1. Install the colour theme, but as a warning, the following command has been known to close the terminal: `source base16-gnome-terminal/base16-tomorrow.dark.sh`

## Shell

I use [oh my zsh](https://github.com/robbyrussell/oh-my-zsh), with a pretty tiny [.zshrc](.zshrc). My config includes:
* my own theme file: [justinf.zsh-theme](justinf.zsh-theme), installed to ~/.oh-my-zsh/custom/themes
* The [auto suggestions plugin](https://github.com/zsh-users/zsh-autosuggestions).
