#!/bin/bash

## Files and cmd
FILE="$HOME/.cache/eww_launch.powermenu"
CFG="$HOME/.config/eww/powermenu"
EWW="$HOME/.local/bin/eww"

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} --config "$CFG" open-many \
		   system \
		   logout \
		   sleep \
		   reboot \
		   poweroff
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} --config "$CFG" close system logout sleep reboot poweroff
	rm "$FILE"
fi
