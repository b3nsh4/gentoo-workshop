#! /bin/bash

red='\033[1;31m'
blue='\033[1;33m'

print "$red \n"
echo "Reading arch..\n"
sys_arch=$(uname --machine)

if [ $sys_arch == "x86_64"]; then
	wget https://www.gentoo.org/downloads/current-install-amd64-minimal

#getting keys to verify signatures!

print "$blue \n"
echo  "use gpg or wget for getting keys? "
select opt in "gpg" "wget"; do
	case $opt in
		gpg)gpg --keyserver hkps://hkps.pool.sks-keyservers.net --recv-keys 0xBB572E0E2D182910

	wget) wget -O- https://gentoo.org/.well-known/openpgpkey/hu/wtktzo4gyuhzu8a4z5fdj3fgmr1u6tob?l=releng | gpg --import

echo "done"

#verifying .DIGESTS.asc

gpg --verify install-x86-minimal-20141204.iso.DIGESTS.asc

#SKIPPING KEY VERIFICATION AND BURNING FOR NOW!

#POST BOOT LIVE-CD

gentoo dopcmcia

#loading modules

modprobe 8139too

passwd

echo "$blue \n"
echo "Create a user "
read username
useradd -m -G users $username

passwd $username

#Not switching to username; switch it manually!

