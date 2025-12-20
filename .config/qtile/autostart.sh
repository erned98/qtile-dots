#! /bin/bash

if [[ $XDG_SESSION_TYPE == "x11" ]]; then
	killall redshift ;
	xrandr -s 1920x1080 &
	feh --bg-fill ~/Pictures/omnia.png &
	redshift &
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	picom --config ~/.config/picom-qtile.conf
	dunst -c ~/.config/dunst/dunstrc &
	xsetroot -cursor_name left_ptr &
	xset -dpms &
	xset s off &
elif [[ $XDG_SESSION_TYPE == "wayland" ]]; then
	killall gammastep ;
	swww-daemon &
	sleep 0.5 &
	swww img ~/Pictures/omnia.png --transition-type none &
	gammastep &
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	dunst -c ~/.config/dunst/dunstrc &
	xsetroot -cursor_name left_ptr &
	xset -dpms &
	xset s off &
fi

