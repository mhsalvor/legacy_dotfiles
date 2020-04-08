#!/usr/bin/env bash
#     _               _              
#    | |             | |             
#    | |__   __ _ ___| |__  _ __ ___ 
#    | '_ \ / _` / __| '_ \| '__/ __|
#   _| |_) | (_| \__ \ | | | | | (__ 
#  (_)_.__/ \__,_|___/_| |_|_|  \___|
#
# ~/.bashrc - executed by bash(1) for non login interactive shells
#
# This file is sourced by all *interactive* bsah shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output. 
#
# Wrtitten to work on *most* GNU/Linux distributions.
# Things not working or WIP are commented. Usually.
# Stolen from many places over the years and tweaked to work for me.
# Feel free to use and modify all or some part of it,
# just remeber: I am not responsible if this breakes your OS or Machine!
#
## by: Giuseppe (mhsalvor) Molinaro g.molianro _at_ gmx.com
#
#

# If not runnint interactively, don't do anything
[[ $- != *i* ]] && return

# Set a font for tty
[[ $TERM = "linux" ]] && setfont ter-116n

#=====|  Shell options

set -o vi # enables vi mode
set -o notify  # immediate background job termination notification
#set -o noclobber # prevents cat-ting over files
#set show-all-if-ambiguous on
#set completion-ignore-case on
#set meta-flag on
#set convert-meta off
#set output-meta on
#set ignoreeof # can't c-d out of shell

shopt -s autocd # navigate directories without cd
#shopt -s cdable_vars # cd looks for variables when deciding if the argument is a valid dir
shopt -s cdspell # autocorrect cd misplelling
shopt -s checkhash # look for commands in the hash table first, then PATH
shopt -s checkwinsize # Make sure display get updated when terminal window get resized
#shopt -s progcomp
shopt -s cmdhist # save multi-line commands in history as a single line
shopt -s complete_fullquote # bash quotes ALL metaharacters in filenames and dir names
shopt -s dotglob # include .files in the expasion of *
shopt -s expand_aliases # exspand aliases in non iteractive (i.e. scripts) shells
shopt -s extglob # Turn on the extended pattern matching features 
shopt -s extquote # $'string' / $"string" quoting within ${parameter} expansions in ""
shopt -s force_fignore # respect the FIGNORE shell variable during completion
shopt -s globasciiranges # ignore current locale collating sequence in range exp
shopt -s histappend # Enable history appending instead of overwriting.
#shopt -s histreedit
#shopt -s histverify
shopt -s hostcomplete # attempt do complete hostnames
#shopt -s nocaseglob
shopt -s interactive_comments # enable comments in interactive shells
shopt -s promptvars # prompt strings undergo paramater expansion/command substitution etc..
shopt -s sourcepath # the source (.) builtin uses PATH to find the argument

export HISTSIZE=10000 # store 10000 commands in history buffer
export HISTFILESIZE=${HISTSIZE} # do the same for the history file
export HISTCONTROL=ignoreboth:erasedupes # ignorespace:ignoredupes; avoid duplicates in history
export HISTCONTROL=$HISTCONTROL # bug in shell
export SAVEHIST=1 # save history regardless of number of terminals

#sty -ixon #disable c-s and c-q
#stty stop undef
#stty start undef

complete -cf sudo # enable <TAB> completion with sudo
complete -A alias	alias unalias
complete -A command	which
complete -A export	export printenv
complete -A hostname	ssh telnet ftp ncftp ping dig nmap
complete -A helptopic	help
complete -A job -P '%'	fg jobs
complete -A setopt	set
complete -A shopt	shopt
complete -A signal	kill killall
complete -A user	su userdel passwd
complete -A group	groupdel groupmod newgrp
complete -A directory	cd rmdir
complete -f -X '!*.@(gif|GIF|jpg|JPG|jpeg|JPEG|png|PNG|xcf)'	gimp
complete -W "$(echo `cat ~/.bash_history | egrep '^ssh ' | sort | uniq | sed 's/^ssh //'`;)"\
       	ssh # autocomplete ssh commands

#umask 022 #default file permissions rw-r--r--

#ulimit -S -c 0 # Don't want any coredumps

# colored GCC warning and errors
# export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:qoute=01"

# allow root to make connections to the X server
xhost +local:root > /dev/null 2>&1

#======| Checks

# Use user defined colors if found
[[ -x /usr/bin/dircolors ]] && eval $(dircolors -b $HOME/.dir_colors) ||\
	eval $(dircolors -b)

# Use bash-completion if present
[[ -r /usr/share/bash-completion/bash_completion ]] && ! shopt -oq posix &&\
       	source /usr/share/bash-completion/bash_completion

# same for git completion
[[ -s /usr/share/git/completion/git-completion.bash ]] &&\
	source /usr/share/git/completion/git-completion.bash

# make less more friendly for non-text input files. Lists files inside archives etc...
[[ -x /usr/bin/lesspipe.sh ]] && eval "$(SHELL=/bin/sh lesspipe.sh)"


#Stay home, stay safe
#curl https://corona-stats.online/Italy

# startup programs

#if [ "$USE_SCREEN" = "Y" ]; then
#    if [ "$UID" -ne 0 ]; then
#        if [ "$SHLVL" -eq 1 ]; then
#            /usr/bin/screen -d -RR
#        fi
#    fi
#fi
#
#if [ -e "/usr/games/fortune" ]; then
#    echo "Fortune: "
#    /usr/games/fortune
#    echo
#fi
#if [ -e "/usr/bin/uptime" ]; then
#    echo "Uptime: ` /usr/bin/uptime`"
#fi
# Fortune and some cosmetic gimmiks, ignore this unless you really want it.
# If you are wondering, try and look from where my username cames from...
#if [ "`id -u`" = "0" ]; then
#	echo -e '\n\e[1;31m'\> Assuming Controll... done.'\n\n\e[0m\e[4;31m\t\t'Terminus System : Acheron Terminal'\n\n\e[0m\e[1;31m'\> Access Level:0, Welcome.'\e[0m'
#else
#	/usr/bin/fortune -a
##	echo -e '\n\e[4;32m\t\t'Terminus System : Acheron Terminal'\n\n\e[1;0m'\> Welcome `whoami`, have a nice day.
#fi


# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*|alacritty*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

# Read ~/.propmtrc for custom prompt, if present, use a defaulf PS1 if not.
selection="_default" #FOR TESTING PURPOSES ONLY! I use this to choose which variant to load
[[ -f $HOME/.prompt.d/prompt$selection ]] &&\
       	source $HOME/.prompt.d/prompt$selection || PS1='[ ERR \u@\h \W]\$ '

# Read ~/.aliasrc for aliases
[[ -f $HOME/.aliasrc ]] && source $HOME/.aliasrc


# Enable thefuck
#eval "$(thefuck --alias)"


