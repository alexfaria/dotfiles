#!/bin/bash
if [ "$(pidof rhythmbox)" ]; then
    music=$(rhythmbox-client --print-playing)
    music="♫ $music"
    LEN=$(echo ${#music})
    MAX=31
    if [ $LEN -lt $MAX ]; then
        echo $music
    else
        echo "${music:0:$(echo $MAX-3)} ..."
    fi
fi
