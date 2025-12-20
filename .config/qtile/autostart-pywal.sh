#! /bin/bash

if [[ $XDG_SESSION_TYPE == "x11" ]]; then
	killall redshift ;
	xrandr -s 1920x1080 &
	~/Scripts/btwos-wallpaper-pywal &
	redshift &
	picom -b &
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	dunst -c ~/.config/dunst/dunstrc &
	xsetroot -cursor_name left_ptr &
	xset -dpms &
	xset s off &
elif [[ $XDG_SESSION_TYPE == "wayland" ]]; then
	killall gammastep ;
	swww-daemon &
	sleep 0.5 &
	~/Scripts/btwos-wallpaper-pywal &
	gammastep &
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	dunst -c ~/.config/dunst/dunstrc &
	xsetroot -cursor_name left_ptr &
	xset -dpms &
	xset s off &
fi

notify-send 'Welcome to btw_OS!' 'If you need help, press Super + F1.'
