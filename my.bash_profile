# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

PATH="$HOME/.local/bin:$PATH"
export PATH

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

stty -ixon

export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\\n$C_GREEN\$$C_DEFAULT "

# User specified environment and startup programs
alias cd..="cd .. && ls"
alias echi="echo"
alias echp="echo"
alias LS="ls"
alias ll="ls -alF"
alias vu="vi"
alias vo="vi"
alias vbp="vi ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias vrc="~/.vimrc"
alias vvrc="vi ~/.vimrc"
alias svrc="source ~/.vimrc"
alias g__="g++"
alias gpp="g++"
alias a="./a.out"
alias MC="make clean"
alias mkae="make"
alias amke="make"
alias amek="make"
alias gd="git diff"
alias gs="git status"
alias Grep="grep"
alias grpe="grep"
