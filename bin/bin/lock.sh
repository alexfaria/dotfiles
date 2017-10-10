#!/usr/bin/env bash

# check if i3 or i3lock is running
if ! pidof i3 > /dev/null || pidof i3lock > /dev/null; then
  exit
fi

# always run before exiting
function finish {
  pkill -u "$USER" -USR2 dunst  # resume notification display
  rm "$image"                     # cleanup files
  echo "Exit"
}
trap finish EXIT

# suspend notification display
pkill -u "$USER" -USR1 dunst

# variables
image=$(mktemp -t tmp.XXXXXXXXXX.png)
icon="$HOME"/bin/lock.png
# res=1920x1080
res=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
suspend=false
ffmpeg=true

while getopts si FLAG; do
  case $FLAG in
    s) # suspend
      suspend=true
      ;;
    i) # use imagemagick
      ffmpeg=false
      ;;
    *) # use default settings
      suspend=false
      ffmpeg=true
      ;;
  esac
done
shift $((OPTIND-1))

if [[ $ffmpeg == true ]]; then
  # use ffmpeg
  echo "using ffmpeg"
  # boxblur=5:1
  ffmpeg -f x11grab -video_size "$res" -y -i "$DISPLAY" -i "$icon" -filter_complex "boxblur=5:50,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 "$image" -loglevel quiet
else
  echo "using scrot + imagemagick"
  # take a screenshot, pixelize it, and add a lock icon
  scrot "$image"
  convert "$image" -scale 10% -scale 1000% "$image"
  convert "$image" "$icon" -gravity center -composite -matte "$image"
fi

# lock the screen
if [[ $suspend == true ]]; then
  echo "preparing to suspend"
  # pause media players
  if mpc | grep -q playing; then mpc pause; fi
  if cmus-remote -Q | grep -q playing; then cmus-remote -u; fi
  if playerctl --player=spotify status | grep -q -i playing; then playerctl --player=spotify pause; fi
  # lock the screen
  i3lock -e -u -i "$image"
else
  echo "preparing to lock"
  # pause media players if they're playing
  if mpc | grep -q playing; then mpc pause && mpd_playing=1; fi
  if cmus-remote -Q | grep -q playing; then cmus-remote -u && cmus_playing=1; fi
  if playerctl --player=spotify status | grep -q -i playing; then playerctl --player=spotify pause && spotify_playing=1; fi
  if pactl list sinks | grep -q "Mute: no"; then pactl set-sink-mute 0 1 && mute=1; fi
  # lock the screen
  i3lock -n -e -u -i "$image"
  # resume playing if they were playing before
  [[ $mpd_playing == 1 ]] && mpc play
  [[ $cmus_playing == 1 ]] && cmus-remote -p
  [[ $spotify_playing == 1 ]] && playerctl --player=spotify play
  [[ $mute == 1 ]] && pactl set-sink-mute 0 0
fi
