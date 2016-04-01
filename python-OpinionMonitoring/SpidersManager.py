# -*- coding: utf-8 -*-
import sys
sys.setrecursionlimit(1000000)
import json
try:
    import queue as Queue
except:
    import Queue
from  SpiderModelPackage.TencentNewsChengDuSpiderModel import TencentNewsChengDuSpider
from  SpiderModelPackage.TencentNewsZiGongSpiderModel import TencentNewsZiGongSpider
from  SpiderModelPackage.NewsSiChuanNewsZiGongSpiderModel import NewsSiChuanNewsZiGongSpider
from  SpiderModelPackage.ZiGongPortalNewsSocialPartSpiderModel import ZiGongPortalNewsSocialPartSpider
from  SpiderModelPackage.LocalHtmlTestSpiderModel import LocalHtmlTestSpider
from  ConfigFileInfoParser.InitializationConfigParser import InitializationConfigParser

class SpidersManager:
    def __init__(self,configPath):
        self.serverConnectConfig = self.GetServerConnectConfig(configPath)
        self.spiderList = []
        pass

    def GetServerConnectConfig(self,configPath):
        initializationConfigParser = InitializationConfigParser(configPath)
        serverConnectConfig = initializationConfigParser.GetAllNodeItems("ServerSocket")
        serverConnectConfig["port"] = int(serverConnectConfig.get("port"))
        return serverConnectConfig

    def CreatSpiders(self,spiderType,seedUrl):
        spider = spiderType(seedUrl)
        self.spiderList.append(spider)

    def SpidersConnectServer(self):
        map(lambda spider : hasattr(spider,"ConnectServer") and spider.ConnectServer(**self.serverConnectConfig),self.spiderList)

    def StartSpiderList(self):
        map(lambda spider : hasattr(spider,"StartMonitor") and spider.StartMonitor(),self.spiderList)

    def StartMonitor(self):
        self.SpidersConnectServer()
        self.StartSpiderList()

    def StopSpiderList(self):
        map(lambda spider : hasattr(spider,"StopMonirot") and spider.StopMonirot(),self.spiderList)


def StartMonitorSpiderManager():
    spiderManager = SpidersManager("ServerConfig.ini")
    # spiderManager.CreatSpiders(LocalHtmlTestSpider,(r"http://192.168.1.217:8080/MonitorSystem/reportlistAction"))
    spiderManager.CreatSpiders(TencentNewsChengDuSpider,(r"http://cd.qq.com/l/news/newshot/list2013071194632.htm"))
    spiderManager.CreatSpiders(TencentNewsZiGongSpider,(r"http://cd.qq.com/news/shangq/zg.htm"))
    spiderManager.CreatSpiders(NewsSiChuanNewsZiGongSpider,(r"http://zg.newssc.org/news/"))
    spiderManager.CreatSpiders(ZiGongPortalNewsSocialPartSpider,(r"http://www.zgm.cn/html/news/soc/"))
    spiderManager.StartMonitor()

if  __name__ == '__main__':
    StartMonitorSpiderManager()
