#!/usr/bin/env bash
# Simple script to redirect url's opened from termite.

# A function containing a case list of options 
open() {
    case "$1" in
        *youtube.com*|*youtu.be*|*odysee.com*|*cda.pl*|*vodlocker.com*|*.webm*|*.mp4*|*.avi)  mpv "$1";;
        *.mp3*)  mpv --no-video "$1";;
        *.png|*.jpeg|*.gif*|*.jpg) feh -Tdefault -F "$1";;  # feh -. = opens to fit window.
        *) qutebrowser --target private-window "$1";  # For everything else.;
    esac
}

# Now a for loop to iterate the list of options, 
for url; do
    open "$url"
done
