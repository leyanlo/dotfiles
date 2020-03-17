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
  PROMPT=$'\n''%B%F{green}%n@%m%f:%F{blue}%~%f%F{red}${vcs_info_msg_0_}%f%b'$'\n''%% '
}
init_prompt

# initialize z
. ~/bin/z.sh

# initialize path
export PATH=/bin:/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:$PATH

# set vscode as default editor
export EDITOR='code --wait'

# load git-completion
autoload -Uz compinit && compinit
