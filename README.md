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

* my own theme file: [justinf.zsh-theme](justinf.zsh-theme), installed to ~/.oh-my-zsh/custom/themes
* The [auto suggestions plugin](https://github.com/zsh-users/zsh-autosuggestions).

## Installation

Install alacritty, victor mono, and starship as appropriate for your platform.

Then execute these commands to clone the repos and link the config files into place.
```
mkdir -p ~/docs/
cd ~/docs
git clone https://github.com/fitzsimmons/term
cd term
./install.bash
```

### Optional utilities

My zshrc aliases several improved cli utilities if they're found in the path:

* [`lsd`](https://github.com/Peltoche/lsd#description), which replaces `ls`
* [ripgrep (`rg`)](https://github.com/BurntSushi/ripgrep#ripgrep-rg), which replaces `grep`
* [`fd`](https://github.com/sharkdp/fd#fd), which replaces `find`
* [`bat`](https://github.com/sharkdp/bat#syntax-highlighting), which replaces `less`
* [bottom (`btm`)](https://github.com/ClementTsang/bottom), which replaces `top`
* [fzf](https://github.com/junegunn/fzf), which doesn't replace anything, it's just an arbitrary fuzzy finder. I have supplied some aliases in my zshrc, notably `cdf`, which can be used to change directory to a subdirectory via fuzzy matching.

Many of these utilities can be installed with `brew` or `cargo` but you're on your own for finding a way to get them for your platform.
