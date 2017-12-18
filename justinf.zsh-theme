# command execution time lifted from spaceship https://github.com/denysdovhan/spaceship-zsh-theme

# Execution time start
function spaceship_exec_time_preexec_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  SPACESHIP_EXEC_TIME_start=$(date +%s)
}

# Execution time end
function spaceship_exec_time_precmd_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  [[ -n $SPACESHIP_EXEC_TIME_duration ]] && unset SPACESHIP_EXEC_TIME_duration
  [[ -z $SPACESHIP_EXEC_TIME_start ]] && return
  local SPACESHIP_EXEC_TIME_stop=$(date +%s)
  SPACESHIP_EXEC_TIME_duration=$(( $SPACESHIP_EXEC_TIME_stop - $SPACESHIP_EXEC_TIME_start ))
  unset SPACESHIP_EXEC_TIME_start
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec spaceship_exec_time_preexec_hook
add-zsh-hook precmd spaceship_exec_time_precmd_hook

local return_code="%(?..%{$fg[red]%} ⬆ %?%{$reset_color%})"
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local rvm_ruby='%{$fg[red]%}$(custom_rvm_prompt_info)%{$reset_color%}'
local git_branch='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}'
local git_stash='%{$fg[yellow]%}$(git_stash_prompt_status)%{$reset_color%}'
local execution_time='%{$fg[blue]%}$(execution_time)%{$reset_color%}'

function execution_time() {
  if [[ "$SPACESHIP_EXEC_TIME_duration" -gt "2" ]]; then
    echo " ⏲$SPACESHIP_EXEC_TIME_duration"
  fi
}

function git_stash_count() {
  $(git status &> /dev/null) || return
  echo `git stash list | wc -l`
}

function git_stash_prompt_status() {
  if [[ `git_stash_count` -gt "0" ]]; then
    echo " `git_stash_count`"
  fi
}

# Hardcodes the use of whitespace since it's very difficult to set ZSH_THEME_RVM_PROMPT_PREFIX/SUFFIX to whitespace or
# null without it being overridden by the defaults thanks to shell's horrible type/equality system
function custom_rvm_prompt_info() {
  [ -f $HOME/.rvm/bin/rvm-prompt ] || return 1
  local rvm_prompt
  rvm_prompt=$($HOME/.rvm/bin/rvm-prompt ${=ZSH_THEME_RVM_PROMPT_OPTIONS} 2>/dev/null)
  [[ "${rvm_prompt}x" == "x" ]] && return 1
  echo " ${rvm_prompt}"
}

PROMPT="${user_host}:${current_dir}${git_branch}${git_stash}${rvm_ruby}${execution_time}${return_code}
%B$(if [ `id -u` = "0" ]; then echo -n "#"; else echo -n ">"; fi)%b "
# RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_RVM_PROMPT_PREFIX=" "
ZSH_THEME_RVM_PROMPT_SUFFIX=""
ZSH_THEME_RVM_PROMPT_OPTIONS="u" #enable fancy unicode shit
