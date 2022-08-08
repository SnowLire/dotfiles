#!/usr/bin/env bash

killall -9 xfsettingsd picom xfce-polkit clipmenud xfce4-power-manager mpd flameshot

xfsettingsd &
/usr/lib/xfce-polkit/xfce-polkit &
xfce4-power-manager &
exec clipmenud &
nitrogen --restore &
exec thunar --daemon &
exec mpd &
exec otd &
exec flameshot &
exec /usr/bin/openrgb --startminimized --profile 'Main' &
exec transmission-gtk &

sleep 3s
pkill openrgb
