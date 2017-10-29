
#!/bin/bash

vol=$(amixer get Master | grep % | cut -d ' ' -f7 | cut -c 2- | cut -d ']' -f1 | head -n1)

if amixer get Master | grep -q "off"; then
    dunstify -r 999 -u critical -t 1 "Volume: $vol (Muted)"
else
    dunstify -r 999 -u normal -t 1 "Volume: $vol"
fi
