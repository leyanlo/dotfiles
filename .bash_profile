# Prompt colors
export CLICOLOR=1
# Inspired by https://gist.github.com/avalarin/35ed329e9cee3943ae0b
function color_my_prompt {
    local __user_and_host="\[\033[1;32m\]\u@\h"
    local __cur_location="\[\033[33m\]\w"
    local __git_branch_color="\[\033[36m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[0;37m\]\n$"
    local __last_color="\[\033[00m\]"
    export PS1="\n$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt
