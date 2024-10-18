# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/shsheep/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker pip golang rust fzf poetry)

source $ZSH/oh-my-zsh.sh
export HOMEBREW_NO_AUTO_UPDATE=1

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
dstrm() {
    cont_id=$1
    docker stop $1 && docker rm $1
}
sdstrm() {
    cont_id=$1
    sudo docker stop $1 && docker rm $1
}
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

compdef _gnu_generic delta
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# alias g++="g++ -std=c++2a"
# alias vy="vim -u -/shsheep/shsheep.vimrc"
alias a="./a.out"
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
alias devenv="cd ~/Workspace/dotfiles"
alias de="docker exec -it"
alias dl="docker logs -f -n 10"
alias di="docker images"
alias doc="docker"
alias dp="docker ps"
alias dpa="docker ps -a"
alias cl="cat *.log"
alias clang-format="clang-format -style=file"
alias echi="echo"
alias echp="echo"
alias gd="git diff"
alias gdt="git difftool"
alias gpp="g++ -std=c++2a"
alias g++="g++ -std=c++2a"
alias GRep="grep"
alias Grep="grep"
alias GRpe="grep"
alias Grpe="grep"
alias grpe="grep"
alias gs="git status"
alias g__="g++ -std=c++2a"
alias ll="ls -alF"
alias llrt="ls -alrtF"
alias LS="ls"
alias MC="make clean"
alias mkae="make"
alias nv="nvim"
alias nvi="nvim"
alias nvrc="nvim ~/.config/nvim/init.vim"
alias nrc="~/.config/nvim/init.vim"
alias nzr="nvim ~/.zshrc"
alias psef="ps -ef"
alias rml="rm -f *.log"
alias szr="source ~/.zshrc"
alias tfl="tail -f *.log"
alias vi="/opt/homebrew/Cellar/vim/9.1.0200/bin/vim"
alias vim="/opt/homebrew/Cellar/vim/9.1.0200/bin/vim"
alias vio="/opt/homebrew/Cellar/vim/9.1.0200/bin/vim -o"
alias viO="/opt/homebrew/Cellar/vim/9.1.0200/bin/vim -O"
alias vo="vi"
alias vrc="~/.vimrc"
alias vu="vi"
alias vvi="\vi"
alias vvrc="vi ~/.vimrc"
alias vzr="vi ~/.zshrc"
alias wiki="cd ~/Workspace/shsheepwiki"

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.rbenv/bin
export PATH=$PATH:$HOME/Library/Python/3.9/bin
export PATH=$PATH:/opt/homebrew/opt/libpq/bin
export PATH=$PATH:/Applications/Cursor.app/Contents/Resources/app/bin

export EDITOR=vim
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/opt/homebrew/bin"
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH=$PATH:$HOME/.local/bin

export UPSTAGE_HOME=$HOME/Upstage

export CUSTOMER_HOME=$UPSTAGE_HOME/docai-enterprise-customer-support
export DATA_HOME=$UPSTAGE_HOME/data
export DIST_HOME=$UPSTAGE_HOME/enterprise-dist
export DOCAI_HOME=$UPSTAGE_HOME/docai-enterprise
export DOCUMENT_HOME=$UPSTAGE_HOME/Documents
export MODEL_HOME=$UPSTAGE_HOME/models
export ISSUE_HOME=$UPSTAGE_HOME/issue
export SHL_HOME=$UPSTAGE_HOME/shl
export STANDARD_HOME=$UPSTAGE_HOME/devops-delivery-standard
export SOLAR_HOME=$UPSTAGE_HOME/solar-system-fe
