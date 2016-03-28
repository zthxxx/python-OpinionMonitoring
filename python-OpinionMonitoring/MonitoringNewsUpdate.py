# -*- coding: utf-8 -*-
import sys
sys.setrecursionlimit(1000000)
import json

from  SpiderModelPackage.TencentNewsChengDuSpiderModel import TencentNewsChengDuSpider
from  SpiderModelPackage.TencentNewsZiGongSpiderModel import TencentNewsZiGongSpider
from  SpiderModelPackage.NewsSiChuanNewsZiGongSpiderModel import NewsSiChuanNewsZiGongSpider
from  SpiderModelPackage.ZiGongPortalNewsSocialPartSpiderModel import ZiGongPortalNewsSocialPartSpider
from  ServerClientSocket.ProcessingQueueManager import ProcessingQueueManager
from  ConfigFileInfoParser.InitializationConfigParser import InitializationConfigParser
from DataBaseOperation.NewsProcessMysqlDBOperation import NewsProcessMysqlDBOperation


def DisplayNewsTotal(serverConnectConfig,*args):
    for spider in args:
        if(hasattr(spider,"GetNewsListTotal")):
            spider.ConnectServer(**serverConnectConfig)
            spider.StartMonitor()



if  __name__ == '__main__':

    initializationConfigParser = InitializationConfigParser("ServerConfig.ini")
    serverConnectConfig = initializationConfigParser.GetAllNodeItems("ServerSocket")
    serverConnectConfig["port"] = int(serverConnectConfig.get("port"))
    dataBaseConnectConfig = initializationConfigParser.GetAllNodeItems("DataBase")
    dataBaseConnectConfig["port"] = int(dataBaseConnectConfig.get("port"))


    spiderTencentChengDuNews = TencentNewsChengDuSpider(r"http://cd.qq.com/l/news/newshot/list2013071194632.htm")
    spiderTencentZiGongNews = TencentNewsZiGongSpider(r"http://cd.qq.com/news/shangq/zg.htm")
    spiderNewsSiChuanNews = NewsSiChuanNewsZiGongSpider(r"http://zg.newssc.org/news/")
    spiderNewsSiChuanNewsZiGongNews = ZiGongPortalNewsSocialPartSpider(r"http://www.zgm.cn/html/news/soc/")

    queueManager = ProcessingQueueManager()
    queueManager.StartManager(**serverConnectConfig)
    mysqlORM = NewsProcessMysqlDBOperation(**dataBaseConnectConfig)
    mysqlORM.Connect()

    DisplayNewsTotal(serverConnectConfig,spiderTencentChengDuNews, spiderTencentZiGongNews,spiderNewsSiChuanNews, spiderNewsSiChuanNewsZiGongNews)

    while(True):
        newsList = queueManager.GetResultQueuePopBlock()
        print(json.dumps(list(newsList), ensure_ascii=False))
        if(newsList is not None):
            for newDict in newsList:
                mysqlORM.SaveAPieceNews(**newDict)


