#! /usr/bin/env bash
#                      __ _ _
#                     / _(_) |
#     _ __  _ __ ___ | |_ _| | ___
#    | '_ \| '__/ _ \|  _| | |/ _ \
#   _| |_) | | | (_) | | | | |  __/
#  (_) .__/|_|  \___/|_| |_|_|\___|
#    | |
#    |_|
#
#       $HOME/.profile - Bash enviroment configuration file
#
# By: Giuseppe (mhsalvor) Molinaro - g.molinaro@linuxmail.org
#

###---= Inizialiaze =---###
# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
    for profile in /etc/profile.d/*.sh; do
        test -r "$profile" && . "$profile"
    done
    unset profile
fi

# Source global bash config
if test "$PS1" && test "$BASH" && test -r /etc/bash.bashrc; then
    . /etc/bash.bashrc
fi

# Source user bash config
[[ -f ~/.bashrc ]] && . ~/.bashrc

umask 022 # Set default umask

###---= Locales =---###
export LANG=it_IT.UTF-8
export LANGUAGE=it_IT.UTF-8:en_US-UTF-8
export LC_ALL=it_IT.UTF-8

export GROFF_ENCODING=utf8

###---= Paths =---###
export PATH="$PATH:/usr/bin/core_perl:$HOME/.config/bspwm:$HOME/.scripts/:$HOME/.local/bin"

###--- XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="/usr/etc/xdg:/etc/xdg"

###--- Config files: keep ~ clean!
export GTK2_RC_FILES="$HOME/.config/gtkrc-2.0"
export MYVIMRC="$HOME/.config/nvim/init.vim"

export NPM_CONFIG_PREFIX="$HOME/.local"

###--- Sockets and Buffers
export PANEL_FIFO="/tmp/panel-fifo"
export BSPWM_SOCKET="/tmp/bspwm-socket"

###---= Preferred Applications =---###
export CODEEDITOR="/usr/bin/code"
export BROWSER="/usr/bin/firefox"           # Prevets xdg-open fork bomb attack
export PBROWSER="/usr/bin/firefox --private-window"
export EDITOR="/usr/bin/nvim"
export VISUAL=/usr/bin/nvim
export FILEMGR=/usr/bin/pcmanfm
export TUIFMNGR=/usr/bin/ranger
export TERMINAL=/usr/bin/alacritty
export CALENDAR=/usr/bin/calcurse
export MAIL=/usr/bin/neomutt
export PAGER=/usr/bin/less  # I may switch to most

export WM="bspwm"

###--- App specific settings
export PANEL_HEIGHT=16                        # reserve some space for the panel
export DOTNET_CLI_TELEMETRY_OPTOUT=1          # Disable .NET telemetry

# Improve the awful Java Gui
export JAVA_FONTS=/usr/share/fonts/TTF
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd_hrgb"

export TERM=xterm-256color          # This is needed for colors to work in alacritty
export COLORTERM="truecolor"        # tells neovim what color settings to use

export QT_QPA_PLATFORMTHEME="qt5ct" # qt5 theme toolkit

###---= Compiler Options =---###
# Compile using as many parallel jobs as possible
export njobs=`getconf _NPROCESSORS_ONLN`
export NUMJOBS="-j$njobs"
export MAKEFLAG="$NUMJOBS"

###---= Final cleaning =---###
unset TERMCAP # Termcap is outdated, old, and crusty, kill it.
unset MANPATH # Man is much better than us at figuring this out

#
##EOF##
