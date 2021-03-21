#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# export X variables
export QT_QPA_PLATFORMTHEME="qt5ct"

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

# activate numlock on startx
numlockx &

# set keyboard delay and repeat rate
xset r rate 200 15 & 

# restore pywal colorscheme
wal -R &

# lock session on idle
xset s 600 
xss-lock -l -- /usr/local/bin/ob-lock &

#exec openbox-session
#exec i3

# Dynamic switcher
# Openbox is started as default
session=${1:-i3}

case $session in
	ob|openbox ) exec openbox-session;;
	i3|i3wm ) exec i3;;
	* ) exec $1;;
esac
