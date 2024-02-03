#!/bin/bash
display=$(xrandr | grep -w DP1 | cut -d " " -f 2)
if [ "$display" == "disconnected" ]; then
    xrandr --output eDP1 --scale 0.7x0.7
    sed -i "s/size = 13.5/size = 11.5/g" $HOME/.config/alacritty/alacritty.toml
else
    xrandr --output eDP1 --off
    sed -i "s/size = 11.5/size = 13.5/g" $HOME/.config/alacritty/alacritty.toml
fi
feh --bg-scale --zoom fill --scale-down $HOME/Other/wallpaper.jpg
