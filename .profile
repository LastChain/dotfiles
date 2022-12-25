# http://localhost:5182/bht.html
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
#export TERMINAL=xfce4-terminal
#export QT_QPA_PLATFORMTHEME=qt5ct
#export QT_QPA_PLATFORMTHEME=qt6ct
##DPI-Settings
#export GDK_SCALE=1.75
#export GDK_DPI_SCALE=0.75
#export QT_FONT_DPI=168
#export QT_SCALE_FACTOR=1.75

#export GDK_SCALE=2.0
#export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=2
export QT_FONT_DPI=192

#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

#export TERM=xterm-256color
#export EDITOR=nvim
#export VISUAL=nvim

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#. "$HOME/.cargo/env"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "/opt/firefox" ] ; then
    PATH="/opt/firefox:$PATH"
fi
