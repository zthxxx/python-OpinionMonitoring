#!/bin/bash

COMMENTS='
Init python 2.7 docker for news server spiders.
'

# root
# python 2.7 docker
# docker run -dit --name news_spider--link news_mysql:db_server python:2.7 /bin/bash
apt-get update
apt-get install -y vim
apt-get install -y unzip
apt-get install -y rinetd
echo "127.0.0.1 3306 db_server 3306" >> /etc/rinetd.conf
rinetd -c /etc/rinetd.conf
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
mv python-OpinionMonitoring-dev OpinionMonitoring
cd OpinionMonitoring/python-OpinionMonitoring
cp ServerConfigSample.ini ServerConfig.ini
sed -i'' "s~passwd = xxxx~passwd = ${MYSQL_ROOT_PASSWORD}~" "ServerConfig.ini"
pip2 install -r requirements.txt
(nohup python2 -u MonitoringNewsUpdate.py >> news_log.log 2>&1)&
(nohup python2 SpidersManager.py >> spiders_log.log 2>&1)&

exit
