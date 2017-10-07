#!/usr/bin/env bash

# pause media players
mpc pause 2&> /dev/null                         # mpd
cmus-remote -u 2&> /dev/null                    # cmus
playerctl --player=spotify pause  2&> /dev/null # spotify

# variables
image=$(mktemp tmp.XXXXXXXXXX.png)
icon=$HOME/bin/lock.png

scrot $image
convert $image -scale 10% -scale 1000% $image
convert $image $icon -gravity center -composite -matte $image
i3lock -e -u -i $image
rm $image
