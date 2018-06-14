#!/bin/bash
File=`ls |sort -R |tail -1`
PD=`pwd`
echo "$File"
~/dotfiles/walSet.sh $File
echo "Set wallpaper"
echo "$File/$PD" > ~/.wallpaperIs
