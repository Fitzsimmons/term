ZSH=$HOME/.oh-my-zsh
export ZSH

plugins=(zsh-autosuggestions)

ZSH_THEME="justinf"

DISABLE_AUTO_UPDATE="true"

# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(rvm)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

export rvm_silence_path_mismatch_check_flag=1
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PYENV_ROOT="$HOME/.pyenv"

PATH=$HOME/bin:$HOME/.local/bin:$PYENV_ROOT/bin:/usr/local/go/bin:/opt/chefdk/bin:$PATH:$HOME/.rvm/bin:/bin:/usr/sbin:$HOME/.tfenv/bin:/usr/local/heroku/bin:$HOME/.cargo/bin
export PATH

alias srsync=rsync\ --rsh=ssh\ --partial\ --progress\ -r
alias jesc="perl -p -e 's/\\n/\\\\n/'"

if which rg &> /dev/null; then
	unalias grep
	alias grep="rg -uu -N"
fi

if which pyenv &> /dev/null; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

if [ -z DISPLAY ]; then
  export EDITOR='nano -w'
else
  export EDITOR='subl --wait --new-window'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

source ~/.zshrc-private
