#!/bin/bash

COMMENTS='
Init mysql 5.6 docker for news server.
'

# root
# mysql 5.6 docker
# docker run -dit -e MYSQL_ROOT_PASSWORD=root --name news_mysql -v /data/mysql/data:/var/lib/mysql -p 3306:3306 mysql:5.6 /bin/bash
# docker exec -d news_mysql service mysql start
# apt-get update
# apt-get install -y vim
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

exit
