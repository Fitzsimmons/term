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

export HOMEBREW_NO_AUTO_UPDATE=1

if which brew &> /dev/null; then
	eval "$(brew shellenv)"
elif [[ -s "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

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

	function cdf() {
		query=$1
		if [ -n "$query" ]; then
			queryflag="--query='${query}'"
		fi

		if which lsd &> /dev/null; then
			preview="lsd --color=always --icon=always {}"
		else
			preview="ls {}"
		fi

		template='cd "$(fzd --height=40%% --preview="%s" %s)"'
		command=$(printf "${template}" "${preview}" "${queryflag}")
		eval "${command}"
	}
fi

export EDITOR='nano -w'

if [ "$(uname)" = "Darwin" ]; then
	alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
	alias smerge='/Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge'
fi

if [ ! -z DISPLAY ]; then
	if which subl &> /dev/null; then
		export EDITOR='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl --wait --new-window'
	fi
fi

[[ -s "$HOME/.zshrc-private" ]] && source ~/.zshrc-private

if which starship &> /dev/null; then
	eval "$(starship init zsh)"
fi
