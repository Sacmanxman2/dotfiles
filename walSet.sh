#!/usr/bin/bash
echo "Setting wallpaper"

if [[ $2 = "--backend" ]]; then
    echo "Custom backend"
    echo "$1"
    rm -f ~/.config/i3/wallpaper/wallpaper.jpg &&
        ln -s "$1" ~/.config/i3/wallpaper/wallpaper.jpg &&
        feh --bg-fil "$1" &&
        wal --backend $3 -n -t -i "$1" &&
        wal_steam -w
else
    echo "Default backend"
    echo "$1"
    rm -f ~/.config/i3/wallpaper/wallpaper.jpg &&
        ln -s "$1" ~/.config/i3/wallpaper/wallpaper.jpg &&
        feh --bg-fil "$1" &&
        wal -n -t -i "$1" &&
        wal_steam -w
fi
