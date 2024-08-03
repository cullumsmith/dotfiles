#!/bin/sh

dpi=96
bg_color=696969
font_size=12
xidle_timeout=900

case $(hostname -s) in
  rlaptop1)
    font_size=16
    ;;
esac

font="-xos4-terminus-medium-r-normal-*-${font_size}-*-*-*-*-*-iso10646-*"
xft_font="Terminus:pixelslize=${font_size}:encoding=iso10646"

xrdb -DDPI="$dpi" -DFONT="$font" -DXFT_FONT="$xft_font" -merge "${HOME}/.Xresources"
xsetroot -solid "#${bg_color}"
xset b off
setxkbmap -option ctrl:nocaps
xidle -program "$(which i3lock) -e -c ${bg_color}" -timeout "$xidle_timeout" &
sudo -n networkmgr &

exec i3
