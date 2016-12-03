#!/bin/bash

COMMENTS='
Init a new server like Ali ECS.
Install docker and pull mysql 5.6, python 2.7 and tomcat 8-jre7.
'

# root
# add user ubuntu and password ubuntu (openssl passwd)
useradd ubuntu -m -s /bin/bash -p dxqevoM5Yk67I 
usermod -G 27 ubuntu
sed -i'' "s~# PermitRootLogin~PermitRootLogin~" "/etc/ssh/sshd_config"
sed -i'' "s~PermitRootLogin yes~PermitRootLogin no~" "/etc/ssh/sshd_config"
sed -i'' "s~ $(hostname)~ ubuntu~" "/etc/hosts"
echo "127.0.0.1 ubuntu" >> /etc/hosts
echo "ubuntu" > /etc/hostname
# create swap area
dd if=/dev/zero of=/swapfile bs=1G count=4
echo "/swapfile none            swap    sw              0      0" >> /etc/fstab
mkswap /swapfile
swapon /swapfile

# there need reboot
mkdir /data
chown ubuntu:ubuntu /data
apt-get update
apt-get upgrade
apt-get install -y curl
curl -SL# https://raw.githubusercontent.com/zthxxx/TianVimrc/master/vimrc -o ~/.vimrc
cp ~/.vimrc /home/ubuntu/.vimrc
pip2 install virtualenv
# install docker
curl -sSL https://get.docker.com/ | sh
usermod -aG docker ubuntu
service docker start

su ubuntu -c ./Server_ubuntu_init.sh
exit




