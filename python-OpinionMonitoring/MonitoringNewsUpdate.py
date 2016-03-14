# -*- coding: utf-8 -*-
import sys
import json
from  SpiderModelPackage.TencentNewsChengDuSpiderModel import TencentNewsChengDuSpider
from  SpiderModelPackage.TencentNewsZiGongSpiderModel import TencentNewsZiGongSpider
from  SpiderModelPackage.NewsSiChuanNewsZiGongSpiderModel import NewsSiChuanNewsZiGongSpider

reload(sys)
sys.setdefaultencoding('utf8')

if  __name__ == '__main__':
    TencentNewsPageSeedUrl = r"http://cd.qq.com/news/shangq/zg.htm"
    spiderTencentNews = TencentNewsZiGongSpider(TencentNewsPageSeedUrl)
    spiderNewsSiChuanNews = NewsSiChuanNewsZiGongSpider(r"http://zg.newssc.org/news/")

    newsDictListTotal = spiderTencentNews.GetNewsListTotal()
    print(json.dumps(newsDictListTotal, encoding="UTF-8", ensure_ascii=False))
    print(len(newsDictListTotal))

