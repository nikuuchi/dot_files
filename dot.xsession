#!/bin/sh

PATH=$PATH:$HOME/.cabal/bin
export PATH
nitrogen --restore &
dropbox start &
exec xmonad

