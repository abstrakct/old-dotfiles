#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
setxkbmap no
#tint2 &
# exec wmii
#exec openbox-session
#exec dbus-launch --exit-with-session ck-launch-session openbox-session
#
xsetroot -cursor_name left_ptr
feh --bg-center ~/Pictures/Wallpapers/crows-1280x960.jpg &
urxvtd -q -f -o &
exec dbus-launch --exit-with-session ck-launch-session xmonad
