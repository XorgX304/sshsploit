#!/bin/bash

#            ---------------------------------------------------
#                            SSHSploit Framework                                                                  
#            ---------------------------------------------------
#                Copyright (C) <2019-2020>  <Entynetproject>
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.

printf '\033]2;install.sh\a'

G="\033[1;34m[*] \033[0m"
S="\033[1;32m[+] \033[0m"
E="\033[1;31m[-] \033[0m"

if [[ $EUID -ne 0 ]]
then
   echo -e ""$E"This script must be run as root!"
   exit
fi

{
ASESR="$(ping -c 1 -q www.google.com >&/dev/null; echo $?)"
} &> /dev/null
if [[ "$ASESR" != 0 ]]
then 
   echo -e ""$E"No Internet connection!"
   exit
fi

sleep 0.5
clear
sleep 0.5
cat banner/banner.txt
echo

sleep 1
echo -e ""$G"Installing dependencies..."
sleep 1

{
pkg update
pkg -y install git
pkg -y install python
apt-get update
apt-get -y install git
apt-get -y install python3
apk update
apk add git
apk add python3
pacman -Sy
pacman -S --noconfirm git
pacman -S --noconfirm python3
zypper refresh
zypper install -y git
zypper install -y python3
yum -y install git
yum -y install python3
dnf -y install git
dnf -y install python3
eopkg update-repo
eopkg -y install git
eopkg -y install python3
xbps-install -S
xbps-install -y git
xbps-install -y python3
} &> /dev/null

if [[ -d ~/sshsploit ]]
then
sleep 0
else
cd ~
{
git clone https://github.com/entynetproject/sshsploit.git
} &> /dev/null
fi

if [[ -d ~/sshsploit ]]
then
cd ~/sshsploit
else
echo -e ""$E"Installation failed!"
exit
fi

{
cd bin
cp sshsploit /usr/local/bin
chmod +x /usr/local/bin/sshsploit
cp sshsploit /bin
chmod +x /bin/sshsploit
cp sshsploit /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/sshsploit
} &> /dev/null

sleep 1
echo -e ""$S"Successfully installed!"
sleep 1
