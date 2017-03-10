local return_code="%(?..%{$fg[red]%} ⬆ %?%{$reset_color%})"
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local rvm_ruby='%{$fg[red]%}$(rvm_prompt_info)%{$reset_color%}'
local git_branch='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}'
local git_stash='%{$fg[yellow]%}$(git_stash_prompt_status)%{$reset_color%}'

function git_stash_count() {
  $(git status &> /dev/null) || return
  echo `git stash list | wc -l`
}

function git_stash_prompt_status() {
  if [[ `git_stash_count` -gt "0" ]]; then
    echo " `git_stash_count`"
  fi
}

PROMPT="${user_host}:${current_dir}${git_branch}${git_stash}${rvm_ruby}${return_code}
%B$(if [ `id -u` = "0" ]; then echo -n "#"; else echo -n ">"; fi)%b "
# RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_RVM_PROMPT_PREFIX=" "
ZSH_THEME_RVM_PROMPT_SUFFIX="$(echo -n -e '\xE2\x80\x8B')"
ZSH_THEME_RVM_PROMPT_OPTIONS="u" #fancy unicode shit
