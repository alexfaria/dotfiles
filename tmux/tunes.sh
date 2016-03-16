#!/bin/bash
if [ "$(pidof rhythmbox)" ]; then
    music=$(rhythmbox-client --print-playing)
    echo "♫ $music"
fi
