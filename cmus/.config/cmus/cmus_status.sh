#!/bin/bash

INFO_CMUS=$(cmus-remote -Q 2>/dev/null)
if [[ $? -eq 0 ]]; then
  INFO_STATUS=$(echo "${INFO_CMUS}" | sed -n -e 's/^.*status//p' | head -n 1)
  INFO_TITLE=$(echo "${INFO_CMUS}" | sed -n -e 's/^.*title//p' | head -n 1)
  INFO_ALBUM=$(echo "${INFO_CMUS}" | sed -n -e 's/^.*album//p' | head -n 1)
  INFO_ARTIST=$(echo "${INFO_CMUS}" | sed -n -e 's/^.*artist//p' | head -n 1)
else
  exit
fi

if [[ "${INFO_ARTIST}" ]] && [[ "${INFO_TITLE}" ]]; then
  if [[ "${INFO_STATUS}" == " paused" ]]; then
    OUT_TEXT="[${INFO_ARTIST} -${INFO_TITLE} ]"
  else
    OUT_TEXT="${INFO_ARTIST} -${INFO_TITLE}"
    notify-send "${OUT_TEXT}"
  fi
elif [[ "${INFO_TITLE}" ]]; then
  if [[ "${INFO_STATUS}" == " paused" ]]; then
    OUT_TEXT="[${INFO_TITLE} ]"
  else
    OUT_TEXT="${INFO_TITLE}"
    notify-send "${OUT_TEXT}"
  fi
fi
polybar-msg -p $(pidof polybar) hook cmus 1
pkill -SIGRTMIN+12 i3blocks
exit
