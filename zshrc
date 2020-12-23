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

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"

PATH=$HOME/bin:$HOME/.local/bin:$PYENV_ROOT/bin:/usr/local/go/bin:$PATH:/bin:/usr/sbin
export PATH

alias srsync=rsync\ --rsh=ssh\ --partial\ --progress\ -r
alias jesc="perl -p -e 's/\\n/\\\\n/'"

if which rg &> /dev/null; then
	unalias grep
	alias grep="rg -uu -N"
fi

if which bat &> /dev/null; then
	alias less=bat
	export BAT_THEME=TwoDark
fi

if which lsd &> /dev/null; then
	alias ls=lsd
fi

if which btm &> /dev/null; then
	alias top='btm -b'
fi

if which pyenv &> /dev/null; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

export EDITOR='nano -w'

if [ ! -z DISPLAY ]; then
	if which subl &> /dev/null; then
		export EDITOR='subl --wait --new-window'
	fi
fi

export GOPATH=$HOME/go

[[ -s "$HOME/.zshrc-private" ]] && source ~/.zshrc-private

# SLACK_HOOK_URL is private, so export it in ~/.zshrc-private
if [ -n SLACK_HOOK_URL ]; then
	function write-slack() {
		message="${1:-"Command Finished."}"
		curl --silent -X POST --data-urlencode "payload={\"username\": \"command-notifier\", \"text\": \"$message\"}" $SLACK_HOOK_URL
	}

	function notify-slack() {
		"$@"
		write-slack "\`$*\` completed."
	}
fi

# https://twitter.com/DynamicWebPaige/status/1045656785305178112
function paigeword {
	local length=${1:-30}

	tr -dc '[:alnum:]' < /dev/urandom | head -c $length
	echo
}

function die {
	local sides=${1:-6}

	shuf -i 1-${sides} -n1
}
