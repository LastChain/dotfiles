# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source .bash_profile
[[ -f ~/.bash_profile ]] && . ~/.bash_profile

# Source .bash_aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

