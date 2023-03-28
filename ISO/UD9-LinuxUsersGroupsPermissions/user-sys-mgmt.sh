#!/bin/bash


# [00. System Preps]
# Likely need to install... finger talk bat
mkdir -p ~/test/admin-UGP/files && cd $_
mkdir man-pages


# [01. Admin Users]
whoami
who
id
passwd -S   # passwd --help
# finger

mesg
tty && man tty > man-pages/tty.log
# write
# wall
# talk -- apt show talk



# [02. Admin Users + Groups]
sudo whoami
sudo cat /etc/passwd | grep $USER > etc-passwd.log
sudo cat /etc/shadow | grep $USER > etc-shadow.log
groups && sudo cat /etc/group | grep $USER > etc-group.log
sudo cat /etc/gshadow | grep $USER > etc-gshadow.log
man newgrp > man-pages/newgrp.log

# sudo adduser
    sudo apt install zsh
    sudo mkdir /etc/skel/test
    sudo echo -e "set number relativenumber \ninore kj <Esc>" > /etc/skel/.vimrc

sudo useradd newUser -m -s /usr/bin/zsh -G 27 # -k /etc/skel-custom # -p changeme
sudo passwd newUser
# sudo deluser --remove-home newUser
# delgroup newUser -- auto, unnecessary...

sudo groupadd coolaf
sudo usermod newUser -a -G coolaf # -s /bin/bash
# sudo delgroup



# [03. Admin Permissions]
pwd         # ~/test/admin-UGP/files
ls -l       # etc-*.log
man chown > man-pages/chown.log
man chgrp > man-pages/chgrp.log
# cat /etc/netplan/*



# [04. System Monitoring]
apt show sysstat > aptShow-sysstat.log
# htop
ps
pstree
# pmap
uptime
free && vmstat

tree /var -L 2 > var-L2.tree
cd /var/log && ls
    batcat auth.log*



: '
- Comment :)
- In [03.] should do the Shared dir as in... https://github.com/pabloqpacin/ASIR/blob/main/ISO/UD5-AdmonInformacion/practicas-ud5.md
'
