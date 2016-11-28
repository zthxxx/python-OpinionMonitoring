
python-OpinionMonitoring
=================

A python spider for monitor public opinion.




Introduction
-------------

This is a example to use python spider get some public opinion in new title and content.

It will interval some time and then spider list of news web for get some news title save into database and judged it as accident or not.

It  use *python 2.7* to crawling some news web, save the news title into *mysql* database, judge from *Naive Bayes*.

Now the spiders module is master-slave mode.

A mater manager for receive data, judge them and save into database, while some spiders working for crawling news from news web.




Basic
-----

Ubuntu 14.04 or later

python 2.7

pip 8.1.2 or later

mysql 5.6



Usage
------

First to install packages require

```bash
# python 2.7
cd python-OpinionMonitoring
pip2 install -r requirements.txt
```

Then configure the ServerConfig 

```bash
cp ServerConfigSample.ini ServerConfig.inig
vim ServerConfig.ini
```

```ini
[ServerSocket]
ServerAddress = <Spider master listen IP address. eg: 127.0.0.1>
port = <Spider master listen port. eg: 5000>
key = <The key for spider communication encrypt>
[DataBase]
host = <Data base IP address, now it use mysql server>
port = <port>
user = <username>
passwd = <password>
db = <Which mysql db name for this opinion>
```

`MonitoringNewsUpdate` is the master and `SpidersManager` is slave manager, all the slave start run from `SpidersManager`.

```bash
# You need run the two commands in two processing.
python2 MonitoringNewsUpdate.py
python2 SpidersManager.py
```

`BayesClassifyVectorTrain` is a trainer for creat cache of bayes vector to speed up the judgement, it need run before bayes use while the database is empty.




License
--------

[MIT License](https://opensource.org/licenses/mit-license.php)

