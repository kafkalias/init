# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


export DEV=$HOME/dev
export SCRIPTS=$HOME/scripts

# JVM Options
export SBT_OPTS="-Xms512M -Xmx4g -Xss1M -XX:MaxMetaspaceSize=4g"

# Hide machine name from theme
DEFAULT_USER="$USER"

# Make some possibly destructive commands more interactive.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

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
alias ....='cd ../../../'                     # Go back 3 directory levels
alias .....='cd ../../../../'                 # Go back 4 directory levels
alias ......='cd ../../../../../'             # Go back 5 directory levels
alias .......='cd ../../../../../../'         # Go back 6 directory levels

alias dev='cd $DEV'

alias c='clear'							      # clears console
alias edit='code'							  # edit: Opens any file in vs code editor

# Docker commands
alias dstop='docker stop $(docker ps -a -q)'  # stops all docker containers
alias drm='docker rm $(docker ps -a -q)'      # removes all docker containers
alias drmi='docker rmi -f $(docker images -a -q)' # removes all docker images
alias dps='docker ps -a'

alias editzsh="edit ~/.zshrc"                # edits .zshrc using vs code
alias editbash="edit ~/.bashrc"
alias srcbash="source ~/.bashrc"
alias srczsh="source ~/.zshrc"               # imports .zshrc
alias es='elasticsearch'                      # starts elasticsearch server
alias update='sudo apt update && sudo apt upgrade' # update packages

# Kubernetes
alias kubenodes='kubectl get nodes'

# Reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

alias s=search
alias search='$SCRIPTS/search'
alias searchf='$SCRIPTS/searchf'
alias replace='$SCRIPTS/replace'
alias dstart='$SCRIPTS/docker-start'

alias epoch='echo $(date +%s)'
alias epochm='echo $(date +%s)000'

NODE_MODULES=$HOME/.npm                                          
NPM_PACKAGES=$HOME/.npm-packages/bin                           
export PATH=$PATH:$HOME/bin:$NODE_MODULES:$NPM_PACKAGES
export PATH=~/.npm-global/bin:$PATH


#MARLOW
export NABOO=$DEV/naboo-be
export NABOO_LOGS=$NABOO/output.log
alias mssh='ssh -i ~/.ssh/marlow_test.pem ec2-user@34.244.211.208'
alias nb='cd $NABOO'
alias ra='nb; sbt runAll >> $NABOO_LOGS 2>&1'
alias logs='nb; less +F $NABOO_LOGS'

# Local Development environment for play
export ENVIRONMENT=local
export ELASTIC_USER=elastic
export ELASTIC_PASSWORD=my_own_password
export ELASTIC_HOSTNAME=localhost
export ELASTIC_PORT=9200
