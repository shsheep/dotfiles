# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=$PATH:$HOME/go/bin:$HOME/.local/bin:/usr/local/go/bin
export EDITOR=vim
export TERM=xterm-256color

. "$HOME/.cargo/env"

# Move cursor word by word by pressing Alt + Left/Right
bind '"\e[1;3C": forward-word'
bind '"\e[1;3D": backward-word'

# Define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

parse_git_branch() {
    git status --short 2> /dev/null 1> /dev/null
    if [ $? -ne 0 ]; then
        return 1
    fi

    cur_branch=$(git branch --show-current)
    file_status=$(git status --short | awk '{print $1}' | sort | uniq -c | tr '\n' ' ' | sed -E 's/([0-9]+) /\1/g; s/  */ /g; s/ *$//')
    stash_size=$(git stash list | wc -l | sed 's/ //g')
    printf " ($cur_branch)$file_status $stash_size"
}

# Should use single quote
# export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[1;31m\]$(parse_git_branch)\n\[\033[1;32m\]\$\[\033[m\] '
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}$C_LIGHTGREEN\u@\h$C_DEFAULT:$C_LIGHTBLUE\w$C_DEFAULT$C_LIGHTRED"'$(parse_git_branch)'"\n$C_LIGHTGREEN\$$C_DEFAULT "

dstrm() {
    for cont_id in "$@"; do
        docker stop -t 2 $cont_id && docker rm $cont_id
    done
}
sdstrm() {
    for cont_id in "$@"; do
        sudo docker stop -t 2 $cont_id && sudo docker rm $cont_id
    done
}
stty -ixon

# User specific environment and startup programs
alias a="./a.out"
alias amek="make"
alias amke="make"
alias c="curl"
alias cd,,,,="cd .. && cd .. && ls"
alias cd,,="cd .. && ls"
alias cd-="cd - && ls"
alias cd....="cd .. && cd .. && ls"
alias cd..="cd .. && ls"
alias cd~="cd ~ && ls"
alias cl="cat *.log"
alias clang-format="clang-format -style=file"
alias devenv="cd ~/Workspace/dotfiles"
alias de="docker exec -it"
alias dl="docker logs -f -n 10"
alias di="docker images"
# alias docker="podman"
alias dp="docker ps"
alias dpa="docker ps -a"
alias echi="echo"
alias echp="echo"
alias g++="g++ -std=c++2a"
alias gd="git diff"
alias gdt="git difftool"
alias glow="glow -s ~/pink.json -w 120"
alias gpp="g++ -std=c++2a"
alias GRep="grep"
alias GRpe="grep"
alias Grep="grep"
alias Grpe="grep"
alias grpe="grep"
alias gs="git status"
alias g__="g++ -std=c++2a"
alias jq="jq --indent 4"
alias iv="vim"
alias k="kubectl"
alias ll="ls -alF"
alias llrt="ls -alrtF"
alias llrth="ls -ahlrtF"
alias LS="ls"
alias MC="make clean"
alias mkae="make"
alias mydu="du -h -d 1"
alias nv="nvim"
alias nvi="nvim"
alias nvrc="vim ~/.vimrc"
alias nrc="~/.config/nvim/init.vim"
alias nzr="nvim ~/.zshrc"
alias psef="ps -ef"
alias rml="rm -f *.log"
alias sbp="source ~/.bash_profile"
alias szr="source ~/.zshrc"
alias tfl="tail -f *.log"
alias vbp="vim ~/.bash_profile"
alias vi="vim"
alias vo="vim"
alias vio="vi -o"
alias viO="vi -O"
alias vo="vi"
alias vrc="~/.vimrc"
alias vu="vi"
alias vvi="vim"
alias vvrc="vi ~/.vimrc"
alias wiki="cd ~/Workspace/shsheepwiki"

if command -v rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"
fi
export CONTAINER_PLATFORM=docker
