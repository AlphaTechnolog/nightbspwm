#!/bin/bash

pkill polybar

polybar main -r -c $HOME/.config/polybar/config.ini &
polybar secondary -r -c $HOME/.config/polybar/config.ini &
