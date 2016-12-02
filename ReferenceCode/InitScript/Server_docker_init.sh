#!/bin/bash

COMMENTS='
Install docker after user ubuntu init.
'

curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://49263176.m.daocloud.io
docker pull mysql:5.6
docker pull python:2.7
docker pull tomcat:8-jre7
# make sure ubuntu have permissions to /data

docker_container_init(){
    cat ${init_script_name} | docker exec -i ${init_docker_name} tee /root/${init_script_name} > /dev/null
    docker exec ${init_docker_name} chmod +x /root/${init_script_name}
    docker exec ${init_docker_name} /root/${init_script_name} | docker exec -i ${init_docker_name} tee -a /root/docker_init.log
}

docker run -dit -e MYSQL_ROOT_PASSWORD=root --name news_mysql -v /data/mysql/data:/var/lib/mysql -p 3306:3306 mysql:5.6 /bin/bash
init_docker_name="news_mysql"
init_script_name="news_mysql_docker_init.sh"
docker_container_init;

docker run -dit -e MYSQL_ROOT_PASSWORD=root --name news_spider --link news_mysql:db_server python:2.7 /bin/bash
init_docker_name="news_spider"
init_script_name="news_spider_docker_init.sh"
docker_container_init;

docker run -dit -e MYSQL_ROOT_PASSWORD=root --name web --link news_mysql:db_server -p 80:80 -p 8080:8080 tomcat:8-jre7 /bin/bash
init_docker_name="web"
init_script_name="news_web_docker_init.sh"
docker_container_init;

exit

