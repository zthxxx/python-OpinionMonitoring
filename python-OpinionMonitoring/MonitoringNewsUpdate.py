# -*- coding: utf-8 -*-
# python 2.7
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
sys.setrecursionlimit(1000000)
import json

from  ConfigFileInfoParser.InitializationConfigParser import InitializationConfigParser
from  ServerClientSocket.ProcessingQueueManager import ProcessingQueueManager
from  DataBaseOperation.NewsProcessMysqlDBOperation import NewsProcessMysqlDBOperation
from  BayesProcess.BayesClassify import BayesClassify



if  __name__ == '__main__':

    initializationConfigParser = InitializationConfigParser("ServerConfig.ini")
    serverConnectConfig = initializationConfigParser.GetAllNodeItems("ServerSocket")
    serverConnectConfig["port"] = int(serverConnectConfig.get("port"))
    dataBaseConnectConfig = initializationConfigParser.GetAllNodeItems("DataBase")
    dataBaseConnectConfig["port"] = int(dataBaseConnectConfig.get("port"))

    queueManager = ProcessingQueueManager()
    queueManager.StartManager(**serverConnectConfig)
    mysqlORM = NewsProcessMysqlDBOperation(**dataBaseConnectConfig)
    mysqlORM.Connect()

    p0Vector,p1Vector,pAbusive,vocabularies = mysqlORM.SelectBayesVector()
    bayes = BayesClassify(p0Vector,p1Vector,pAbusive,vocabularies)


    while(True):
        newsList = queueManager.GetResultQueuePopBlock()
        print(json.dumps(list(newsList), ensure_ascii=False))
        if(newsList is not None):
            for newDict in newsList:
                title = newDict["NoPunctuationTitle"]
                newDict["isAccident"] = bayes.BayesClassifyOperation(title)
                mysqlORM.SaveAPieceNews(**newDict)


