# allow comments in zsh
setopt interactivecomments

# add color for ls
export CLICOLOR=1

# initialize prompt
function init-prompt {
  # load version control information
  autoload -Uz vcs_info
  zstyle ':vcs_info:*' enable git svn
  precmd() { vcs_info }

  # format vcs_info_msg_0_ variable
  zstyle ':vcs_info:git:*' formats ' [%b]'
  zstyle ':vcs_info:git:*' actionformats ' [%b|%a]'

  # initialize prompt (with git branch name)
  setopt PROMPT_SUBST
  PROMPT=$'\n''%F{240}%D{%Y-%m-%dT%H:%M:%S}%f %B%F{green}%n@%m%f:%F{blue}%~%f%F{red}${vcs_info_msg_0_}%f%b'$'\n''%% '
}
init-prompt

# initialize z
. ~/bin/z.sh

# initialize path
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:/Applications/WebStorm.app/Contents/MacOS:$PATH"

# set Sublime as default editor
export VISUAL='subl --wait'
export EDITOR='subl --wait'

# add alias for webstorm
alias ws="webstorm"

# load git-completion
autoload -Uz compinit && compinit

# fnm
[ -x "$(command -v fnm)" ] && eval "$(fnm env)"

# automatically switch node version
autoload -U add-zsh-hook
prev_nvm_path=""
load-nvmrc() {
  local nvm_path=$PWD
  while [[ "$nvm_path" != "" && ! -e "$nvm_path/.nvmrc" ]]; do
    nvm_path=${nvm_path%/*}
  done

  if [[ "$nvm_path" != "$prev_nvm_path" ]]; then
    if [[ -z "$nvm_path" ]]; then
      fnm use default
    else
      fnm use $(cat "$nvm_path/.nvmrc")
    fi
    prev_nvm_path="$nvm_path"
  fi
}
add-zsh-hook chpwd load-nvmrc && load-nvmrc

# cache nodejs
export NODE_COMPILE_CACHE=~/.cache/nodejs-compile-cache
