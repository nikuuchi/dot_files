#!/bin/sh

PATH=$PATH:$HOME/.cabal/bin
export PATH
nitrogen --restore &
dropbox start &
nm-applet &
gnome-sound-applet &
exec xmonad

