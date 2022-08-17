#!/usr/bin/bash

killall -9 xfsettingsd xfce-polkit clipmenud xfce4-power-manager mpd flameshot

sxhkd -c $HOME/.config/berry/sxhkdrc &

xfsettingsd &
/usr/lib/xfce-polkit/xfce-polkit &
xfce4-power-manager &
exec clipmenud &
nitrogen --restore &
polybar -q main -c .config/berry/polybar/config.ini &
exec thunar --daemon &
exec mpd &
exec otd &
exec flameshot &
exec /usr/bin/openrgb --startminimized --profile 'Main' &

sleep 3s
pkill openrgb

