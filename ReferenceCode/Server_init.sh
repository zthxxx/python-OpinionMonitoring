#!/bin/bash

COMMENTS='
Init a new server like Ali ECS.
Install docker and pull mysql 5.6, python 2.7 and tomcat 8-jre7.
'

# root
cd /
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
mkdir /data
chown ubuntu:ubuntu /data

echo '
set number
set relativenumber
filetype on
set history=1000
set background=dark
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set ruler
set nowrap
set textwidth=0
set hlsearch
' | tee ~/.vimrc
cp ~/.vimrc /home/ubunut/.vimrc
apt-get update
apt-get upgrade
pip2 install virtualenv
reboot

# ubuntu
echo "
[global]
index-url = http://pypi.douban.com/simple
trusted-host = pypi.douban.com
" >> ~/.pip/pip.conf
cd ~
mkdir Download
cd Download
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker ubuntu
sudo service docker start
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://49263176.m.daocloud.io
docker pull mysql:5.6
docker pull python:2.7
docker pull tomcat:8-jre7
mkdir -p /data/mysql/data

# mysql 5.6 docker
# docker run -dit -e MYSQL_ROOT_PASSWORD=root --name news_mysql -v /data/mysql/data:/var/lib/mysql -p 3306:3306 mysql:5.6 /bin/bash
# docker exec -it news_mysql service mysql start
apt-get update
apt-get install -y vim
service mysql start
cd ~
mkdir Download
cd Download
new_base_name="news_processor"
curl -#S "https://raw.githubusercontent.com/zthxxx/python-OpinionMonitoring/dev/ReferenceCode/${new_base_name}.sql" -o "${new_base_name}.sql"
mysql -e "create database IF NOT EXISTS ${new_base_name} default character set utf8 COLLATE utf8_general_ci;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"
mysql -e "flush privileges;"
mysql -u root -p${MYSQL_ROOT_PASSWORD} --default-character-set=utf8 ${new_base_name} < ${new_base_name}.sql

# python 2.7 docker
# docker run -dit --name news_spider--link news_mysql:db_server python:2.7 /bin/bash
apt-get update
apt-get install -y vim
apt-get install -y unzip
echo "
[global]
index-url = http://pypi.douban.com/simple
trusted-host = pypi.douban.com
" >> ~/.pip/pip.conf
echo "
root soft nofile 65535
root hard nofile 65535
* soft nofile 65535
* hard nofile 65535
" >> /etc/security/limits.conf
cd ~
mkdir Download
cd Download
curl -#S https://codeload.github.com/zthxxx/python-OpinionMonitoring/zip/dev -o python-OpinionMonitoring.zip
unzip python-OpinionMonitoring.zip
# rm -f python-OpinionMonitoring.zip
mv python-OpinionMonitoring-dev OpinionMonitoring
cd OpinionMonitoring/python-OpinionMonitoring
cp ServerConfigSample.ini ServerConfig.ini
pip2 install -r requirements.txt
# vim ServerConfig.ini
# (nohup python2 -u MonitoringNewsUpdate.py >> news_log.log 2>&1)&
# (nohup python2 SpidersManager.py >> spiders_log.log 2>&1)&

# tomcat 8 jre7 docker
# docker run -dit -p 80:80 -p 8080:8080 --name web --link news_mysql:db_server tomcat:8-jre7 /bin/bash

apt-get update
apt-get install -y telnet
apt-get install -y rinetd
echo "127.0.0.1 3306 db_server 3306" >> /etc/rinetd.conf
cd /usr/local/tomcat/
curl -#S "https://raw.githubusercontent.com/zthxxx/python-OpinionMonitoring/dev/ReferenceCode/MonitorSystem_v0.1.war" -o ./webapps/MonitorSystem_v0.1.war
bin/startup.sh


