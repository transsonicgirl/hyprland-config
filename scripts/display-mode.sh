#!/bin/bash
# Check if TV is connected and active
TV="DP-2"
LAPTOP="eDP-1"

if hyprctl monitors | grep -q "$TV"; then
    # TV mode: disable laptop screen, move all workspaces to TV
    hyprctl keyword monitor "$LAPTOP, disable"
    for i in 1 2 3 4 5 6 7 8 9 10; do
        hyprctl dispatch moveworkspacetomonitor "$i $TV" 2>/dev/null
    done
else
    # Laptop mode: enable laptop screen
    hyprctl keyword monitor "$LAPTOP, preferred, 0x0, 1"
fi
