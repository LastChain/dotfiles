# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

export EDITOR="nvim"

#export BROWSER='/mnt/c/Windows/explorer.exe'

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

alias vky="$EDITOR ~/.config/kitty/kitty.conf"
#alias vim="$EDITOR"
#alias vi="$EDITOR"
alias v="$EDITOR"
alias vux="$EDITOR ~/.tmux.conf"

alias vbashrc="source ~/.bashrc; echo '~/.bashrc reloaded ..'"
alias vbash="$EDITOR ~/.bashrc"
alias vbash_a="$EDITOR ~/.bash_aliases"
alias vbash_p="$EDITOR ~/.bash_profile"

alias vimrc="cd ~/.config/nvim/lua/chain/ && clear"
alias vimrc_="cd ~/.config/nvim/after/plugin/ && clear"

alias upd="sudo apt update && sudo apt upgrade && sudo apt autoremove && flatpak update"
# alias upd_="flatpak update"

alias cdc="cd ~/Dropbox/bht/ && clear"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


## start LanguageTool-Http Server and or Tray
alias lngT='cd /home/chain/LanguageTool;nohup java -Dsun.java2d.uiScale=2 -jar languagetool.jar --tray &'
alias lngS='nohup java -cp "/home/chain/LanguageTool/languagetool-server.jar" org.languagetool.server.HTTPServer --port 8763 --allow-origin "*" --languageModel "/home/chain/LanguageTool/ngrams" --word2vecModel "/home/chain/LanguageTool/word2vec" &'


# Bare Dotfiles Repo Init
# -----------------------
# first call in dotfiles-folder/repo:
#
# config config --local status.showUntrackedFiles no
#
alias config='/usr/bin/git --git-dir=/home/chain/dotfiles --work-tree=/home/chain'
