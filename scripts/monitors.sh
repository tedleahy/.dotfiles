#!/bin/sh

function external() {
  xrandr --newmode "2560x1080"  230.76  2560 2728 3000 3440  1080 1081 1084 1118  -HSync +Vsync
  xrandr --addmode HDMI1 "2560x1080"
  xrandr --output HDMI1 --mode 2560x1080 --left-of eDP1
  xrandr --output eDP1 --off
  setxkbmap -model macintosh -layout us -option caps:escape
  xset r rate 300 50
}

function laptop() {
  xrandr --output eDP1 --mode 1920x1080
  xrandr --output HDMI1 --off
  setxkbmap -model macintosh -layout gb -option caps:escape
  xset r rate 300 50
}

function both() {
  xrandr --output eDP1 --mode 1920x1080
  xrandr --output HDMI1 --mode 2560x1080 --left-of eDP1
  setxkbmap -model macintosh -layout us -option caps:escape
  xset r rate 300 50
}

case $1 in
  "external"|"e")
    external
    ;;
  "laptop"|"l")
    laptop
    ;;
  "both"|"b")
    both
    ;;
esac

# Increase key repeat speed
xset r rate 300 50

# restart polybar to fix bar disappearing or having 2 bars
~/.config/polybar/launch.sh > /dev/null 2>&1 &
