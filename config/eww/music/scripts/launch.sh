
#!/bin/bash

# change this if necesary
eww="eww -c $HOME/.config/eww/music"

if ! $eww ping 2>&1 > /dev/null; then
  $eww daemon
fi

if ! $eww state | grep name 2>&1 > /dev/null; then
  # it's not running, opening
  $eww open music
else
  # it's running, closing
  $eww close music
fi
