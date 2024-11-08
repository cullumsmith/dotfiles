#!/bin/sh

. "${HOME}/.profile"

if [ -z "$XDG_CURRENT_DESKTOP" ]; then
  . "${HOME}/.xinitrc"
fi
