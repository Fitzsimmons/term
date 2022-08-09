ZSH=$HOME/.oh-my-zsh
export ZSH

plugins=(zsh-autosuggestions asdf)

ZSH_THEME="justinf"

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh
unsetopt correct_all


export GOPATH=$HOME/go
export GOPROXY=https://proxy.golang.org

PATH=$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH:/bin:/usr/sbin:$GOPATH/bin
export PATH

alias srsync=rsync\ --rsh=ssh\ --partial\ --progress\ -r
alias jesc="perl -p -e 's/\\n/\\\\n/'"

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

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

if which terraform &> /dev/null; then
	alias tf=terraform
fi

if which fzf &> /dev/null; then
	if which fd &> /dev/null; then
		alias fzd='fd -t d | fzf'
	else
		alias fzd='find -t d | fzf'
	fi
fi

export EDITOR='nano -w'

if [ "$(uname)" = "Darwin" ]; then
	alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
	alias smerge='/Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge'

	if which brew %> /dev/null; then
		eval "$(brew shellenv)"
	elif [[ -s "/opt/homebrew/bin/brew" ]]; then
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
fi

if [ ! -z DISPLAY ]; then
	if which subl &> /dev/null; then
		export EDITOR='subl --wait --new-window'
	fi
fi

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

function roll {
	local sides=${1:-6}

	shuf -i 1-${sides} -n1
}
