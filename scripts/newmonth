#! /bin/sh

# first, let's authenticate!
echo -ne '
\e[3m\e[1;33mYou need to authenticate before we proceed. At first, we will look for the fastest mirrors.\e[0m

'

# now, after we authenticate, let's take care of the repos
sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist
eos-rankmirrors --verbose
rate-mirrors chaotic-aur

# update the packages
echo -ne '
\e[3m\e[1;36mUpdating the packages...\e[0m

'
yay -Syyu

# cleaning the journal
echo -ne '
\e[3m\e[1;36mCleaning the journal...\e[0m

'
journalctl --vacuum-time=4weeks

# cleaning the cache
echo -ne '
\e[3m\e[1;36mCleaning the package cache...\e[0m

'
paccache -rv
paccache -ruvk1

# deleting the orphans
echo -ne '
\e[3m\e[1;36mUninstalling the orphaned packages...\e[0m

'
yay -Rns $(pacman -Qdtq)

# done
echo -ne '
\e[3m\e[1;32mAll done. \e[1;37mYou should reboot your system if your core packages have been updated.\e[0m

'

exit
