#! /bin/sh

## first, let's install some components
yay -S --noconfirm ttf-jetbrains-mono-nerd terminus-font flat-remix-gtk flat-remix spicetify-cli shell-color-scripts-git fortune-mod

## now, let's rice!

cp -rv .config ~
cp -rv .local ~
cp -rv .vim ~
cp -rv .mpd ~
cp -rv scripts ~/Scripts
cp -rv Pictures ~/Pictures
mkdir -pv ~/Pictures/Screenshots
sudo rm /usr/share/fortune/*
sudo cp -rv usr /
sudo cp -rv etc /

for i in .bashrc .vimrc .viminfo
    do 
        ln -rsfv $i ~/$i
        sudo ln -rsfv $i /root/~$i
    done

# spicetify backup apply enable-devtools
# spicetify config current_theme text
# spicetify config color_scheme FlatRemixEOS

echo -e '\e[1;32mThe ricing has completed. \e[1;97mYou can reboot now. Have fun using your system!\e[0m'
exit
