#!/bin/bash
export TERM="xterm-256color"

pac=$(checkupdates | wc -l)
aur=$(yaourt -Qqu -a| wc -l)

check=$((pac + aur))
if [[ "$check" != "0" ]]
then
    echo "$pac %{F#5b5b5b}%{F-} $aur"
fi
