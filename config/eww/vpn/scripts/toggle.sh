#!/bin/bash

# change this if necesary
eww="eww -c $HOME/.config/eww/vpn"

if ! $eww ping 2>&1 > /dev/null; then
  $eww daemon
fi

if ! $eww state | grep ip 2>&1 > /dev/null; then
  # it's not running, opening
  $eww open vpn
else
  # it's running, closing
  $eww close vpn
fi
