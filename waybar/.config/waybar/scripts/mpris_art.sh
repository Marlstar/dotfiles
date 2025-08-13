#!/usr/bin/env bash
path=$(playerctl metadata mpris:artUrl | sed "s/file:\/\///g")
if [[ -z $path ]] 
then
   exit
fi

filename=$(echo $path | sed -E "s/[\/a-zA-Z\.0-9_-]*\///g")
extension=$(echo $filename | sed -E "s/[\.a-zA-Z0-9\._-]*\.//g")

output_path="/tmp/waybar_mpris_art.png"

if [ $extension = "png" ]; then
	cp -f $path $output_path
else
	tmpfile=$(mktemp --suffix=.png)
	ffmpeg -hide_banner -loglevel error -i "${path}" $tmpfile
	cp -f $tmpfile $output_path
fi;

echo $output_path
