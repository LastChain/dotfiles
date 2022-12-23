###############################################
# ~/.bashrc: executed by bash(1) for non-login shells.
###############################################
#
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


###############################################
# Source .bash_profile
# [[ -f ~/.bash_profile ]] && . ~/.bash_profile
###############################################

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# limits recursive functions, see 'man bash'
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cargo init
. "$HOME/.cargo/env"

# KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi

# get current git-branch, if available
function current_git_branch() {
  CURRENT_GIT_BRANCH=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
  if [ -n "$CURRENT_GIT_BRANCH" ] 
  then echo -e " ($CURRENT_GIT_BRANCH)"
  fi
  return ;
}

export TERMINAL="kitty"


force_color_prompt=yes
_set_my_PS1() {
#colors

  c0="\[$(tput setaf 0)\]"    
  c1="\[$(tput setaf 1)\]"    
  c2="\[$(tput setaf 2)\]"    
  c3="\[$(tput setaf 3)\]"    
  c4="\[$(tput setaf 4)\]"    
  c5="\[$(tput setaf 5)\]"    
  c6="\[$(tput setaf 6)\]"    
  c7="\[$(tput setaf 7)\]"    
  #c227="\[$(tput setaf 227)\]"  
  #c237="\[$(tput setaf 237)\]"  
  BOLD="\[$(tput bold)\]"       
  DIM="\[$(tput dim)\]"        
  END="\[$(tput sgr0)\]"       
#style
  cha1="${BOLD}${c7}┌[${END}"
  cha2="${BOLD}${c7}└[${END}"
  cha3="${BOLD}${c7}[${END}"
  cha4="${BOLD}${c7}]${END}"
  cha5="${BOLD}${c1}λ${END}"
  cha6=" ${BOLD}${c2}>_${END} "
  newL="\n"
  path="${BOLD}${c3}\w${END}"
  time="${BOLD}${c4}\T${END}"
  git="${BOLD}${c6}\$(current_git_branch)${END}"
#the_prompt_shell
  PS1="${cha1}${time}${cha4}${cha3}${path}${cha4}${newL}${cha2}${cha5}${cha4}${git}${cha6}"
}
_set_my_PS1
unset -f _set_my_PS1



###############################################
# Source .bash_aliases
# [[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
###############################################
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

export EDITOR="nvim"
export BROWSER='/mnt/c/Windows/explorer.exe'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    
    # Changing "ls" to "exa"
    alias ls='exa -a --color=always --group-directories-first' # my preferred listing
    alias la='exa -al --color=always --group-directories-first'  # all files and dirs
    alias ll='exa -l --color=always --group-directories-first'  # long format
    alias lt='exa -aT --color=always --group-directories-first' # tree listing
    alias l.='exa -a | egrep "^\."'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias vbashrc="source ~/.bashrc; echo '~/.bashrc reloaded ..'"
alias vbash="$EDITOR ~/.bashrc"
#alias vbash_a="$EDITOR ~/.bash_aliases"
#alias vbash_p="$EDITOR ~/.bash_profile"
#alias vky="$EDITOR ~/.config/kitty/kitty.conf"
#alias vim="$EDITOR"
#alias vi="$EDITOR"
alias v="$EDITOR"
alias vimrc="cd ~/.config/nvim/lua/chain/ && clear"
alias vux="$EDITOR ~/.tmux.conf"
alias update="sudo apt update && sudo apt upgrade"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## start LanguageTool-Http Server and or Tray
#alias lngT='cd /home/chain/LanguageTool;nohup java -Dsun.java2d.uiScale=2 -jar languagetool.jar --tray &'
#alias lngS='nohup java -cp "/home/chain/LanguageTool/languagetool-server.jar" org.languagetool.server.HTTPServer --port 8763 --allow-origin "*" --languageModel "/home/chain/LanguageTool/ngrams" --word2vecModel "/home/chain/LanguageTool/word2vec" &'

# Bare Dotfiles Repo Init
# -----------------------
# first call in dotfiles-folder/repo:
#
# config config --local status.showUntrackedFiles no
#
alias config='/usr/bin/git --git-dir=/home/chain/dotfiles --work-tree=/home/chain'

# Custom

alias cdc="cd ~/Dropbox/bht/ && clear"

