# $HOME/.profile

#Set our umask
umask 022

export LANG=it_IT.UTF-8
export LANGUAGE=it_IT.UTF-8
export LINGUAS=it_IT.UTF-8
export LC_ALL=it_IT.UTF-8

# Set our default path
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin/core_perl:/usr/bin:$HOME/.config/bspwm/panel:$HOME/.bin:$HOME/.scripts:$HOME/.local/bin"
export PANEL_FIFO="/tmp/panel-fifo"
export PATH
export XDG_CONFIG_HOME="$HOME/.config"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export PANEL_HEIGHT=20
export XDG_CONFIG_DIRS=/usr/etc/xdg:/etc/xdg:~/.config
export GUI_EDITOR=/usr/bin/code
export BROWSER=/usr/bin/firefox
export PBROWSER="/usr/bin/firefox --private-window"
export TERMINAL=/usr/bin/alacritty
export TERM=xterm-256color
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/micro
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export PAGER=/usr/bin/less  # I may switch to most
export GROFF_ENCODING=utf8
export CALENDAR=/usr/bin/calcurse
export FILEMGR=/usr/bin/pcmanfm
export TUIFMNGR=/usr/bin/ranger:
export MAIL=/usr/bin/neomutt
export NPM_CONFIG_PREFIX=~/.local
# Disable .NET telemetry (should not be necessary with Codium, but...)
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Improve the awful Java Gui
export JAVA_FONTS=/usr/share/fonts/TTF
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd_hrgb"

# Compile using as many parallel jobs as possible
export njobs=`getconf _NPROCESSORS_ONLN`
export NUMJOBS="-j$njobs"

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

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

#
##EOF##
