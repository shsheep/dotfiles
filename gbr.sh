#!/bin/bash
parse_git_branch() {
    git status --short 2> /dev/null 1> /dev/null
    if [ "$?" -ne "0" ]; then
        exit 1
    else
        branch="$(git branch --show-current)"
        branch_str="\033[1;031m$branch\033[0m"

        stat=$(git status --short \
            | awk '{print $1}' \
            | sort | uniq -c \
            | tr '\n' ' ' \
            | sed -E 's/([0-9]+) /\1/g; s/  */ /g; s/ *$//')

        stash_size=$(git stash list | wc -l | sed 's/ //g')
        stash_icon=" \e[0;92m≡\033[0m"
        printf "[$branch_str]$stat$stash_icon$stash_size"
        exit 0
    fi
}
