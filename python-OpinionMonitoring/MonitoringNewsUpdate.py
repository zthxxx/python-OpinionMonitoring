# -*- coding: utf-8 -*-
import sys
import json
from  SpiderModelPackage.TencentNewsChengDuSpiderModel import TencentNewsChengDuSpider
from  SpiderModelPackage.TencentNewsZiGongSpiderModel import TencentNewsZiGongSpider
from  SpiderModelPackage.NewsSiChuanNewsZiGongSpiderModel import NewsSiChuanNewsZiGongSpider
from  SpiderModelPackage.ZiGongPortalNewsSocialPartSpiderModel import ZiGongPortalNewsSocialPartSpider


def DisplayNewsTotal(*args):
    for spider in args:
        if(hasattr(spider,"GetNewsListTotal")):
            newsDictListTotal=(spider.GetNewsListTotal())
            print(json.dumps(newsDictListTotal,  ensure_ascii=False))
            print(len(newsDictListTotal))


if  __name__ == '__main__':
    spiderTencentChengDuNews = TencentNewsChengDuSpider(r"http://cd.qq.com/l/news/newshot/list2013071194632.htm")
    spiderTencentZiGongNews = TencentNewsZiGongSpider(r"http://cd.qq.com/news/shangq/zg.htm")
    spiderNewsSiChuanNews = NewsSiChuanNewsZiGongSpider(r"http://zg.newssc.org/news/")
    spiderNewsSiChuanNewsZiGongNews = ZiGongPortalNewsSocialPartSpider(r"http://www.zgm.cn/html/news/soc/")
    DisplayNewsTotal(spiderTencentChengDuNews, spiderTencentZiGongNews, spiderNewsSiChuanNews, spiderNewsSiChuanNewsZiGongNews)

