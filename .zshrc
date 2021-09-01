# add color for ls
export CLICOLOR=1

# initialize prompt
function init_prompt {
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
init_prompt

# initialize z
. ~/bin/z.sh

# initialize path
export PATH=/bin:/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:$PATH

# set vscode as default editor
export VISUAL='code --wait'
export EDITOR='code --wait'

# load git-completion
autoload -Uz compinit && compinit

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# automatically switch nvm
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
