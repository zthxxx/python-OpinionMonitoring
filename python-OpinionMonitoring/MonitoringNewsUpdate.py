# -*- coding: utf-8 -*-
import sys
import urllib2
import re
import gzip
import json
from StringIO import StringIO
from bs4 import BeautifulSoup
from  SpiderModelPackage import TencentNewChengDuSpiderMoudel


reload(sys)
sys.setdefaultencoding('utf8')

if  __name__ == '__main__':
    TencentNewsPageSeedUrl = "http://cd.qq.com/l/news/newshot/list2013071194632.htm"
    spiderTencentNews = TencentNewChengDuSpiderMoudel.TencentNewChengDuSpider(TencentNewsPageSeedUrl)
    newsDictListTotal = spiderTencentNews.GetNewsListTotal()
    print(json.dumps(newsDictListTotal, encoding="UTF-8", ensure_ascii=False))
    print(len(newsDictListTotal))

