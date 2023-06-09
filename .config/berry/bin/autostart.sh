#!/usr/bin/bash

sxhkd -c $HOME/.config/berry/sxhkdrc &

xfsettingsd &
/usr/lib/xfce-polkit/xfce-polkit &
xfce4-power-manager &
nitrogen --restore &
polybar -q main -c .config/berry/polybar/config.ini &
exec thunar --daemon &
exec flameshot &
