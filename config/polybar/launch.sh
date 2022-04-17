#!/bin/bash

pkill polybar

get_monitors () {
  xrandr | \
    grep -w 'connected' | \
    awk '{print $1}'
}

multimonitor_support () {
  for monitor in $(get_monitors); do
    MONITOR=$monitor polybar main -r -c $HOME/.config/polybar/config.ini &
  done
}

if type "xrandr"; then
  multimonitor_support
else
  polybar main -r -c $HOME/.config/polybar/config.ini &
fi
