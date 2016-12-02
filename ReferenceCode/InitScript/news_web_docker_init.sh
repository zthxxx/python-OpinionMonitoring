#!/bin/bash

COMMENTS='
Init tomcat web docker for news server.
'

# root
# tomcat 8 jre7 docker
# docker run -dit -p 80:80 -p 8080:8080 --name web --link news_mysql:db_server tomcat:8-jre7 /bin/bash
apt-get update
apt-get install -y telnet
apt-get install -y rinetd
echo "127.0.0.1 3306 db_server 3306" >> /etc/rinetd.conf
rinetd -c /etc/rinetd.conf
cd /usr/local/tomcat/
curl -#S "https://raw.githubusercontent.com/zthxxx/python-OpinionMonitoring/dev/ReferenceCode/MonitorSystem_v0.1.war" -o ./webapps/MonitorSystem_v0.1.war
bin/startup.sh

