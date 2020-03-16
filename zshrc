# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/Library/Frameworks/Python.framework/Versions/3.6/bin

export DEV=$HOME/dev
export DJANGO_COLORS="dark;error=yellow/blue,blink;notice=magenta"

export ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Local Development environment for play
export ENVIRONMENT=local
export elastic=my_own_password
# Android env params
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/.local/bin

# GOLANG env Variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/git/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# JVM Options
export SBT_OPTS="-Xms512M -Xmx4g -Xss1M -XX:MaxMetaspaceSize=4g"

# AWS ENV VARS
export PATH="~/.ebcli-virtual-env/executables:$PATH"

#Apache Kafka
export KAFKA_HOME=/usr/local/kafka
export PATH=$PATH:$KAFKA_HOME/bin

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLINE_RIGHT_A_COLOR_FRONT="black"
POWERLINE_RIGHT_A_COLOR_BACK="red"
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_PATH="short"
POWERLINE_DETECT_SSH="true"
POWERLINE_GIT_CLEAN="✔"
POWERLINE_GIT_DIRTY="✘"
POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
POWERLINE_GIT_RENAMED="➜"
POWERLINE_GIT_UNMERGED="═"
POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Hide machine name from theme
DEFAULT_USER="$USER"

# Preserve history in session
unsetopt inc_append_history
unsetopt share_history

# Colour output on Mac OS
export CLICOLOR=1

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy.mm.dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to w~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose git history node npm sudo aws sbt vscode zsh-syntax-highlighting zsh-autosuggestions)

# imports everithing from oh-my-zsh
source $ZSH/oh-my-zsh.sh

# make alt + arrow-keys work with intellij's terminal
bindkey "\e\eOD" backward-word 
bindkey "\e\eOC" forward-word

# Expand the history size
HISTFILESIZE=100000 
HISTSIZE=999999

# Default locale
export LANG=en_GB.UTF-8

#Append commands to the bash command history file (~/.bash_history)
#instead of overwriting it.
setopt APPEND_HISTORY

grep='grep --color=auto'

# Easier ls shortcuts
alias ll='ls -lL --color=auto'
alias la='ls -a --color=auto'
alias ls='ls --color=auto'

# Directory
alias mkdir='mkdir -pv'
alias rmdir='rmdir -pv'
alias path='echo -e ${PATH//:/\\n}'

# Processes
alias psaux='ps aux | grep'
alias kill='kill -9'

# general aliases
alias cd..='cd ../'                           # Go back 1 directory level (for fast typers)
alias ..='cd ../'                             # Go back 1 directory level
alias ...='cd ../../'                         # Go back 2 directory levels
alias .3='cd ../../../'                       # Go back 3 directory levels
alias .4='cd ../../../../'                    # Go back 4 directory levels
alias .5='cd ../../../../../'                 # Go back 5 directory levels
alias .6='cd ../../../../../../'              # Go back 6 directory levels
alias c='clear'							      # clears console
alias edit='code'							  # edit: Opens any file in vs code editor
alias getip='ipconfig getifaddr en0'          # gets machine IP
alias dstop='docker stop $(docker ps -a -q)'  # stops all docker containers
alias drm='docker rm $(docker ps -a -q)'      # removes all docker containers
alias dstart='~/scripts/docker-start'
alias drmi='docker rmi -f $(docker images -a -q)' # removes all docker images
alias editconf="code ~/.zshrc"                # edits .zshrc using vs code
alias srcconf="source ~/.zshrc"               # imports .zshrc
alias es='elasticsearch'                      # starts elasticsearch server
alias update='sudo apt update && sudo apt upgrade' # update packages
alias openFinder='nautilus .'                 # opens current directory to file manager
# Kubernetes
alias kubenodes='kubectl get nodes'

# Reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias s=search

alias search='~/scripts/search'

alias epoch='echo $(date +%s)'

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

NODE_MODULES=$HOME/.npm                                          
NPM_PACKAGES=$HOME/.npm-packages/bin                           
export PATH=$PATH:$HOME/bin:$NODE_MODULES:$NPM_PACKAGES

# Node Enviroment Variables
export NODE_ENV=development
export BABEL_ENV=$NODE_ENV

emulate sh -c 'source /etc/profile'

#MARLOW
alias mssh='ssh -i ~/.ssh/marlow_test.pem ec2-user@34.244.211.208'
alias nb='cd $DEV/naboo-be'
alias ra='nb; sbt runAll'




