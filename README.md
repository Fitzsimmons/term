# Term

There are many like it, but this one is mine.

![screenshot](screenshot.png)

## Terminal emulator

I use [alacritty](https://alacritty.org/).

## Font

I use [Victor Mono](https://rubjo.github.io/victor-mono/) with the additional [nerd font glyphs](https://www.nerdfonts.com/font-downloads). I prefer the oblique italics mode over the cursive.

## Terminal colours

I use the [base16](https://github.com/aarowill/base16-alacritty) tomorrow night eighties theme for alacritty.

## Prompt

I use [starship](https://starship.rs/) to render my prompt, although my zshrc will gracefully fall back to my old oh-my-zsh theme if starship is not available.

## Shell

I use [oh my zsh](https://github.com/robbyrussell/oh-my-zsh), with a pretty tiny [.zshrc](zshrc). My config includes:
* 
* my own theme file: [justinf.zsh-theme](justinf.zsh-theme), installed to ~/.oh-my-zsh/custom/themes
* The [auto suggestions plugin](https://github.com/zsh-users/zsh-autosuggestions).

## Installation

Install alacritty, victor mono, and starship as appropriate for your OS. Then clone the repos and set up your config files.

```
mkdir -p ~/docs/
cd ~/docs
git clone https://github.com/fitzsimmons/term
cd term
git clone https://github.com/aarowill/base16-alacritty
ln -s ~/docs/zshrc ~/.zshrc
ln -s ~/docs/alacritty.yml ~/.alacritty.yml
ln -s ~/docs/starship.toml ~/.config/starship.toml
```

### Optional utilities

My zshrc aliases several improved cli utilities if they're found in the path:

* [`lsd`](https://github.com/Peltoche/lsd#description), which replaces `ls`
* [ripgrep (`rg`)](https://github.com/BurntSushi/ripgrep#ripgrep-rg), which replaces `grep`
* [`fd`](https://github.com/sharkdp/fd#fd), which replaces `find`
* [`bat`](https://github.com/sharkdp/bat#syntax-highlighting), which replaces `less`

I have included `cli-utils-downloader.bash` as a way to download the latest releases of these apps for linux and put them in `~/bin`.
