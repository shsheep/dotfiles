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
plugins=(git docker pip golang rust)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# alias g++="g++ -std=c++2a"
# alias vy="vim -u -/shsheep/shsheep.vimrc"
alias a="./a.out"
alias a="./a.out"
alias amek="make"
alias amke="make"
alias cd,,,,="cd .. && cd .. && ls"
alias cd,,="cd .. && ls"
alias cd-="cd - && ls"
alias cd....="cd .. && cd .. && ls"
alias cd..="cd .. && ls"
alias cd~="cd ~ && ls"
alias devenv="cd ~/Workspace/dotfiles"
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
alias GRep="grep"
alias Grep="grep"
alias GRpe="grep"
alias Grpe="grep"
alias grpe="grep"
alias gs="git status"
alias g__="g++ -std=c++2a"
alias ll="ls -alF"
alias LS="ls"
alias MC="make clean"
alias mkae="make"
alias nvrc="nvim ~/.config/nvim/init.vim"
alias rml="rm -f *.log"
alias szr="source ~/.zshrc"
alias tfl="tail -f *.log"
alias vi="nvim"
alias vo="nvim"
alias vrc="~/.config/nvim/init.vim"
alias vu="nvim"
alias vvrc="nvim ~/.config/nvim/init.vim"
alias vzr="nvim ~/.zshrc"

export PATH=$PATH:~/Downloads/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$HOME/.rbenv/bin
export EDITOR=nvim
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/Workspace/vimscript-language-server/target/debug"
export PATH="$PATH:$HOME/Workspace/prometheus-2.45.0-rc.1.darwin-amd64"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
