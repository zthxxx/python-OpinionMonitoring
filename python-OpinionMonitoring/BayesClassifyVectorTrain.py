# -*- coding: utf-8 -*-
# python 2.7
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
sys.setrecursionlimit(1000000)
import json

from  ConfigFileInfoParser.InitializationConfigParser import InitializationConfigParser
from  DataBaseOperation.NewsProcessMysqlDBOperation import NewsProcessMysqlDBOperation
from  BayesProcess.BayesClassify import BayesClassify




if  __name__ == '__main__':

    initializationConfigParser = InitializationConfigParser("ServerConfig.ini")
    dataBaseConnectConfig = initializationConfigParser.GetAllNodeItems("DataBase")
    dataBaseConnectConfig["port"] = int(dataBaseConnectConfig.get("port"))

    mysqlORM = NewsProcessMysqlDBOperation(**dataBaseConnectConfig)
    mysqlORM.Connect()

    bayes = BayesClassify()
    p0Vector,p1Vector,vocabularies= bayes.TrainSet(mysqlORM.SelectTrainsetClassified(1),mysqlORM.SelectTrainsetClassified(0))
    mysqlORM.InsertBayesVector(p0Vector,p1Vector,vocabularies)
    print("OK")