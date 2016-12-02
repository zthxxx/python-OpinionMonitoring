#!/bin/bash

COMMENTS='
Install server user of ubuntu env.
'

# ubuntu
mkdir -p /data/mysql/data
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

su ubuntu -s /bin/bash Server_docker_init.sh
exit




