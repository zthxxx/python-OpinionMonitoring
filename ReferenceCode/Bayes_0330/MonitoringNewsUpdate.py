# -*- coding: utf-8 -*-
import sys
sys.setrecursionlimit(1000000)
import json

from  SpiderModelPackage.TencentNewsChengDuSpiderModel import TencentNewsChengDuSpider
from  SpiderModelPackage.TencentNewsZiGongSpiderModel import TencentNewsZiGongSpider
from  SpiderModelPackage.NewsSiChuanNewsZiGongSpiderModel import NewsSiChuanNewsZiGongSpider
from  SpiderModelPackage.ZiGongPortalNewsSocialPartSpiderModel import ZiGongPortalNewsSocialPartSpider
from  SpiderModelPackage.LocalHtmlTestSpiderModel import LocalHtmlTestSpider

from  ServerClientSocket.ProcessingQueueManager import ProcessingQueueManager
from  ConfigFileInfoParser.InitializationConfigParser import InitializationConfigParser
from  DataBaseOperation.NewsProcessMysqlDBOperation import NewsProcessMysqlDBOperation
from  BayesProcess.BayesClassify import BayesClassify

def DisplayNewsTotal(serverConnectConfig,*args):
    for spider in args:
        if(hasattr(spider,"GetNewsListTotal")):
            spider.ConnectServer(**serverConnectConfig)
            spider.StartMonitor()

if  __name__ == '__main__':
    # 初始化输入参数
    initializationConfigParser = InitializationConfigParser("ServerConfig.ini")
    serverConnectConfig = initializationConfigParser.GetAllNodeItems("ServerSocket")
    serverConnectConfig["port"] = int(serverConnectConfig.get("port"))
    dataBaseConnectConfig = initializationConfigParser.GetAllNodeItems("DataBase")
    dataBaseConnectConfig["port"] = int(dataBaseConnectConfig.get("port"))

    # 爬虫&解析
    spiderTencentChengDuNews = TencentNewsChengDuSpider(r"http://cd.qq.com/l/news/newshot/list2013071194632.htm")
    spiderTencentZiGongNews = TencentNewsZiGongSpider(r"http://cd.qq.com/news/shangq/zg.htm")
    spiderNewsSiChuanNews = NewsSiChuanNewsZiGongSpider(r"http://zg.newssc.org/news/")
    spiderNewsSiChuanNewsZiGongNews = ZiGongPortalNewsSocialPartSpider(r"http://www.zgm.cn/html/news/soc/")
    # SpiderLocalHtmlTest = LocalHtmlTestSpider(r"http://192.168.1.217:8080/MonitorSystem/reportlistAction")

    # 进程通信
    queueManager = ProcessingQueueManager()
    queueManager.StartManager(**serverConnectConfig)
    mysqlORM = NewsProcessMysqlDBOperation(**dataBaseConnectConfig)
    mysqlORM.Connect()

    # 结果展示
    DisplayNewsTotal(serverConnectConfig,spiderTencentChengDuNews, spiderTencentZiGongNews,spiderNewsSiChuanNews, spiderNewsSiChuanNewsZiGongNews)

    while(True):
        newsList = queueManager.GetResultQueuePopBlock()
        print(json.dumps(list(newsList), ensure_ascii=False))
        bayes = BayesClassify()
        p0V, p1V, pAb,vocabList = bayes._TrainSet()
        if(newsList is not None):
            for newDict in newsList:
                title = newDict["NoPunctuationTitle"]
                newDict["isAccident"] = bayes.BayesOperation(title, p0V, p1V, pAb,vocabList)
                mysqlORM.SaveAPieceNews(**newDict)