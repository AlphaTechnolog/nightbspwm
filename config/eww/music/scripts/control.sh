#!/bin/bash

if [[ $1 == "prev" ]]; then
  playerctl previous
elif [[ $1 == "get-music" ]]; then
  music=$(playerctl metadata --format "{{ title }}" 2>&1)
  echo " ${music}"
elif [[ $1 == "next" ]]; then
  playerctl next
elif [[ $1 == "pause" ]]; then
  playerctl play-pause
fi
