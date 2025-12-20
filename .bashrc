
# 
# ██████╗  █████╗ ███████╗██╗  ██╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║
# ██████╔╝███████║███████╗███████║
# ██╔══██╗██╔══██║╚════██║██╔══██║
# ██████╔╝██║  ██║███████║██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
#                                 

# 
# ┌┬┐┌─┐┌─┐┌─┐┬ ┬┬ ┌┬┐┌─┐
#  ││├┤ ├┤ ├─┤│ ││  │ └─┐
# ─┴┘└─┘└  ┴ ┴└─┘┴─┘┴ └─┘
# 
if [[ $(tty) =~ /dev/tty ]]; then
    export BROWSER="w3m"
else
    export BROWSER="qutebrowser"
fi

export EDITOR="vim"
export VISUAL="vim"
export SUDO_EDITOR="vim"
export DIFFPROG="colordiff"

# Set the right language rendering for tty
if [[ $(tty) =~ /dev/tty ]]; then
    setfont ter-232n
fi

# 
# ┌─┐┌─┐┌─┐┌┬┐┬ ┬┌─┐┌┬┐┬┌─┐┌─┐
# ├─┤├┤ └─┐ │ ├─┤├┤  │ ││  └─┐
# ┴ ┴└─┘└─┘ ┴ ┴ ┴└─┘ ┴ ┴└─┘└─┘
# 

# Enable colours
if [[ $(tty) =~ /dev/pts ]]; then
    command -v lsd > /dev/null && alias ls='lsd -lah --group-dirs first'
    command -v lsd > /dev/null && alias tree='lsd --tree'
    command -v bat > /dev/null && alias cat='echo && bat --theme=base16 --pager=never -p'
else
    alias ls='ls --color=auto -lah --group-directories-first'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color=auto'
alias qalc='qalc -c'

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export MANROFFOPT=-c

# Set a fancy prompt
if [[ $TERM = "xterm-kitty" ]]; then
    export STARSHIP_CONFIG=~/.config/starship-nerd.toml
elif [[ $TERM = "xterm-256color" ]]; then
	export STARSHIP_CONFIG=~/.config/starship-unicode.toml
else
	export STARSHIP_CONFIG=~/.config/starship-tty.toml
fi

eval "$(starship init bash)"

# Start with a colourscript and a fortune cookie
export FORTUNE=$(fortune -s)
if [[ $TERM = "xterm-kitty" ]]; then
    colorscript -r && echo -e "\n\e[3m${FORTUNE}"
else 
    echo -e "\n${FORTUNE}"
fi

# 
# ┌─┐┬  ┬┌─┐┌─┐┌─┐┌─┐
# ├─┤│  │├─┤└─┐├┤ └─┐
# ┴ ┴┴─┘┴┴ ┴└─┘└─┘└─┘
#

## Basic
alias ..='cd ..'
alias 2..='cd ../..'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'
alias 5..='cd ../../../../..'
alias h='cd ~'
alias df='df -h -x tmpfs'
alias du='du -h --max-depth=1 2> /dev/null | sort -h -r | head -n20'
alias free='free -h'
alias mkdir='mkdir -p'
alias wiki='wikiman -q'
alias q='exit'
alias rb='reboot'
alias pwr='shutdown -h'

## Dotfiles
alias rld='clear && source ~/.bashrc'
alias n='$EDITOR'
alias sn='sudoedit'
alias g.='cd ~/.config'
alias gc='git clone'
alias gcm='git commit -m'
alias shrc='$EDITOR ~/.bashrc'
alias wmrc='$EDITOR ~/.config/bspwm/bspwmrc'
alias sxrc='$EDITOR ~/.config/sxhkd/sxhkdrc'
alias pbrc='$EDITOR ~/.config/polybar/config.ini'
alias ktrc='$EDITOR ~/.config/kitty/kitty.conf'
alias drc='$EDITOR ~/.config/dunst/dunstrc'

if [[ $TERM = "xterm-kitty" ]]; then
    alias strc='$EDITOR ~/.config/starship-kitty.toml'
else
    alias strc='$EDITOR ~/.config/starship-tty.toml'
fi

## Productivity
alias rec='ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0 ~/Videos/Screencasts/rec-$(date +%y%m%d%H%M).mp4'
alias ytmp4="yt-dlp -f 'bestvideo[altezza<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --cookies-from-browser firefox"
alias ytmp3="yt-dlp -f 'bestaudio/best' --extract-audio --audio-format mp3 --audio-quality 320k --add-metadata --cookies-from-browser firefox"
alias ping='ping -c 20'
alias stf1='starship explain'

## For the memes
alias fetch='echo && fastfetch -l none'
alias clr='colorscript -e blocks1'
alias hello="notify-send 'Oh, hi! Nice to see you!' 'Remember to take regular breaks and drink water!' -i tux"
alias btw="notify-send 'i use arch btw' -i /usr/share/icons/Flat-Remix-Orange-Dark/status/scalable/512/distributor-logo-archlinux.svg"
alias pls='sudo $(fc -ln -1)'

## Scripts
alias bton='sh ~/Scripts/bton'
alias rsp='sh ~/Scripts/respice'
alias wttr='sh ~/Scripts/wttr'
alias newmonth='sh ~/Scripts/newmonth'
alias detox='sh ~/Scripts/dnsdetox'

## Archive extraction
function ex {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "ex: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

## Package management
# Pacman / Yay
alias s='yay -S'
alias sy='yay -Sy'
alias syu='yay -Syu'
alias rn='yay -Rn'
alias rns='yay -Rns'
alias ss='yay -Ss'
alias pw='yay -Pw'
alias pww='yay -Pww'
alias Q='pacman -Q'
alias ql='pacman -Q | wc -l'
alias si='pacman -Si'
alias qdtq='yay -Rns $(pacman -Qdtq)'

## APT / Nala
# alias s='sudo nala install'
# alias sy='sudo nala update'
# alias syu='sudo nala upgrade'
# alias rn='sudo nala purge'
# alias rns='sudo nala purge --autoremove'
# alias ss='nala search'
# alias Q='apt list --installed | wc -l'
# alias qdtq='sudo nala autoremove --purge'


