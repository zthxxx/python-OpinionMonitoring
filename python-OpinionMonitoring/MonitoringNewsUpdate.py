# -*- coding: utf-8 -*-
import sys
sys.setrecursionlimit(1000000)
import json

from  SpiderModelPackage.TencentNewsChengDuSpiderModel import TencentNewsChengDuSpider
from  SpiderModelPackage.TencentNewsZiGongSpiderModel import TencentNewsZiGongSpider
from  SpiderModelPackage.NewsSiChuanNewsZiGongSpiderModel import NewsSiChuanNewsZiGongSpider
from  SpiderModelPackage.ZiGongPortalNewsSocialPartSpiderModel import ZiGongPortalNewsSocialPartSpider
from ServerClientSocket.ProcessingQueueManager import ProcessingQueueManager


connectKey = {'ipAddress':'127.0.0.1','port':5000,'key':b'abc'}

def DisplayNewsTotal(*args):
    for spider in args:
        if(hasattr(spider,"GetNewsListTotal")):
            spider.ConnectServer(connectKey['ipAddress'],connectKey['port'],connectKey['key'])
            newsDictListTotal=spider.GetNewsListAndPutToQueue()
            # print(len(newsDictListTotal) , json.dumps(newsDictListTotal,  ensure_ascii=False))



if  __name__ == '__main__':
    spiderTencentChengDuNews = TencentNewsChengDuSpider(r"http://cd.qq.com/l/news/newshot/list2013071194632.htm")
    spiderTencentZiGongNews = TencentNewsZiGongSpider(r"http://cd.qq.com/news/shangq/zg.htm")
    spiderNewsSiChuanNews = NewsSiChuanNewsZiGongSpider(r"http://zg.newssc.org/news/")
    spiderNewsSiChuanNewsZiGongNews = ZiGongPortalNewsSocialPartSpider(r"http://www.zgm.cn/html/news/soc/")

    QueueManager = ProcessingQueueManager()
    QueueManager.StartManager(connectKey['ipAddress'],connectKey['port'],connectKey['key'])

    DisplayNewsTotal(spiderTencentChengDuNews, spiderTencentZiGongNews,spiderNewsSiChuanNews, spiderNewsSiChuanNewsZiGongNews)
    while(True):
        print(json.dumps(QueueManager.GetResultQueuePopBlock(),  ensure_ascii=False))

