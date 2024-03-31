#!/bin/bash

set -euo pipefail

(
    readonly current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    ln -s "$current_dir/zshrc" ~/.zshrc
    ln -s "$current_dir/justinf.zsh-theme" ~/.oh-my-zsh/custom/themes

    mkdir -p ~/.config
    ln -s "$current_dir/starship.toml" ~/.config/starship.toml
)
