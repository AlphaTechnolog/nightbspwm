#!/bin/bash

# This is a script to autostart some applications like picom
# or merge some Xresources or change the wallpaper, or in This
# case is necesary to start sxhkd

#  NOTE: This is an example file, you can change it with your stuff

xsetroot -cursor_name left_ptr
picom -b --experimental-backends

# notification manager
dunst &

# Wallpaper
feh --bg-scale $HOME/.config/wallpapers/misc/wal.png

# don't remove this please
pkill bspc
pkill polybar
sxhkd &

# spawn polybar
polylaunchfile=$HOME/.config/polybar/launch.sh

if test -f $polylaunchfile; then
  bash $polylaunchfile
fi

# redshift
redshift -x
redshift -O 7500

# notifmonitord
pkill notifmonitord
sudo rm -rf /opt/notifications-monitor/daemon.lck
notifmonitod 2>&1 > /dev/null &

# eww
eww -c ~/.config/eww/vpn daemon
