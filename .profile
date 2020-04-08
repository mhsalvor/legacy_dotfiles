export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/code
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export PAGER=/usr/bin/less	# maybe install most and change it
export GROFF_ENCODING=utf8
export TERM=xterm-256color

# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

# Disable .NET telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export FILEMNGR=/usr/bin/pcmanfm

# Improve the awful Java Gui
export JAVA_FONTS=/usr/share/fonts/TTF
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd_hrgb"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Using the proper locale is important
export LANG=it_IT.UTF-8
export LANGUAGE=it_IT.UTF-8
export LINGUAS=it_IT.UTF-8
export LC_ALL=it_IT.UTF-8

# Compile using as much parallel jobs as possible
export njobs=`getconf _NPROCESSORS_ONLN`
export NUMJOBS="-j$njobs"

#export QT_SELECT=4

export TERMINAL="sterminal"
