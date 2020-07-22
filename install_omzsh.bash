#!/bin/bash

set -euo pipefail

(
    readonly current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    ln -sf "$current_dir/zshrc" ~/.zshrc
    ln -sf "$current_dir/justinf.zsh-theme" ~/.oh-my-zsh/custom/themes
)