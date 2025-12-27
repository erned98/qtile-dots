#! /bin/sh

## before we start...

echo -e '\n\e[1;91mWARNING!\e[1;97m This script assumes you have access to AUR (Arch User Repository). \e[0m\n\nYou can continue running this script if you have AUR helper installed (in this case, yay).\nIf not, exit the script and install AUR helper as follows: \n\n1. git clone https://aur.archlinux.org/yay.git \n2. cd yay \n3. makepkg -si \n\nAlso, bear in mind that script can install the apps you define in the last section. \n\e[1;97mIt might be a good idea to step back and examine the script if you have not done it yet.\e[0m\n\n'

while true; do
    read -p "Do you wish to continue running the script? (y/n) " yn
    case $yn in
        [yes]* )
            ## first of all, let's take care of mirrors
            sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist
            
            ## let's set up Chaotic-AUR
            # We start by retrieving the primary key to enable the installation of our keyring and mirror list.
            sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
            sudo pacman-key --lsign-key 3056513887B78AEB

            # This allows us to install our chaotic-keyring and chaotic-mirrorlist packages.
            sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
            sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

            # Then, we append (adding at the end) the following to /etc/pacman.conf:
            sudo sed -i -e '$a\\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' /etc/pacman.conf

            # We recommend running a full system update along syncing our mirrorlist.
            sudo pacman -Syu rate-mirrors yay

            ## now, let's install!
            # let's install graphical environment and basic utilities
            PS3='Please choose your video drivers: '
            options=("Intel" "AMD" "Nvidia" "QXL" "Abort")
            select opt in "${options[@]}"
            do
                case $opt in
                    "Intel")
                        export graphics='xf86-video-intel' && break
                        ;;
                    "AMD")
                        export graphics='xf86-video-amdgpu' && break
                        ;;
                    "Nvidia")
                        export graphics='nvidia nvidia-utils' && break
                        ;;
                    "QXL")
                        export graphics='xf86-video-qxl' && break
                        ;;
                    "VMWare")
                        export graphics='xf86-video-vmware' && break
                        ;;
                    "Abort")
                        echo -e '\e[1;31mInstallation aborted.' ; exit
                        ;;
                    *) echo "Option invalid.";;
                esac
            done

            echo -e '\n\e[1;96mInstalling graphical environment and basic utilities...'
            yay -S --noconfirm xorg xorg-xinit $graphics zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting kitty lsd bat qtile python-pywlroots picom rofi dunst pulsemixer polkit-gnome ly betterlockscreen pipewire pipewire-pulse pipewire-alsa pipewire-jack ufw
            
            # let's install basic apps
            echo -e '\n\e[1;96mInstalling basic applications...'
            yay -S --noconfirm feh zathura zathura-pdf-mupdf ranger python-pillow fastfetch mpv gvim timeshift maim nwg-look htop w3m

            # let's install some additional apps - EXAMINE THAT PART AND REDACT IT IF YOU WISH TO
            echo -e '\n\e[1;96mInstalling user-defined applications...'
            yay -S --noconfirm brave-bin android-tools libreoffice-fresh libqalculate spotify-player calcurse newsboat redshift gammastep mp3gain ffmpeg gimp
            
            # let's turn on some services
            sudo systemctl enable ly.service
            sudo systemctl enable ufw.service
            chsh -s /usr/bin/zsh
            
            # now, let's rice!
            echo -e '\n\e[1;32mThe installation has completed. \e[1;97mNow, run the script rice.sh to start applying customisations to your desktop.\e[0m' ; exit
            ;;
        [no]* ) echo -e '\e[1;91mInstallation aborted.' ; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

