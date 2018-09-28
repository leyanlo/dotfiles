. ~/bin/bash_colors.sh

# Colored PS1 with git branch inspired by https://gist.github.com/avalarin/35ed329e9cee3943ae0b
export CLICOLOR=1
function color_my_prompt {
    local __user_and_host="${BRIGHT_GREEN}\u@\h"
    local __colon="${NORMAL}:"
    local __cur_location="${BRIGHT_BLUE}\w"
    local __git_branch_color="${BRIGHT_RED}"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="${NORMAL}\n$"
    export PS1="\n$__user_and_host$__colon$__cur_location $__git_branch_color$__git_branch$__prompt_tail "
}
color_my_prompt

# z
. ~/bin/z.sh

export PATH=/bin:/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:$PATH
export EDITOR='code --wait' # Set Visual Studio Code as default editor

# git-completion
# 1. Install brew
# 2. Run `brew install git && brew install bash-completion`
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

eval "$(rbenv init -)"
