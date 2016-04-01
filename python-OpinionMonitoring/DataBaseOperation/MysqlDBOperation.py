# -*- coding: utf-8 -*-
try:
    import MySQLdb
except:
    import pymysql as MySQLdb
import time

class MysqlDBOperation:
    def __init__(self,host="localhost",port=3306,user="root",passwd="root",db="mysql",charset="utf8"):
        self.connectConfig = dict()
        self.connectConfig["host"] = host
        self.connectConfig["port"] = port
        self.connectConfig["user"] = user
        self.connectConfig["passwd"] = passwd
        self.connectConfig["db"] = db
        self.connectConfig["charset"] = charset
        self.MysqlLinker = None

    def __del__(self):
        self.CloseConnect()

    def IsRaiseError(methodName):
        def TryUseMethod(*args, **kw):
            try:
                if(callable(methodName)):
                    return methodName(*args, **kw)
            except Exception as errorInfor:
                print(methodName,errorInfor)
                return None
        return TryUseMethod

    @IsRaiseError
    def TryCommit(self):
        try:
            self.MysqlLinker.commit()
        except:
            self.MysqlLinker.rollback()


    #@IsRaiseError
    def Connect(self):
        if (self.MysqlLinker is None):
            self.MysqlLinker = MySQLdb.connect(**self.connectConfig)


    #@IsRaiseError
    def CloseConnect(self):
        if (self.MysqlLinker is not None):
            self.MysqlLinker.close()
            del self.MysqlLinker
            self.MysqlLinker = None
            print("MysqlDataBase disconnect.")

    #@IsRaiseError
    def Select(self,sqlSentence,args=()):
        cursor = self.MysqlLinker.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute(sqlSentence,args)
        result = cursor.fetchall()
        return result

    #@IsRaiseError
    def CallPorcess(self,procname,args=()):
        cursor = self.MysqlLinker.cursor(MySQLdb.cursors.DictCursor)
        cursor.callproc(procname,args)
        self.TryCommit()
        result = cursor.fetchall()
        return result

    #@IsRaiseError
    def InsertOrUpdate(self,sqlSentence,args,many=False):
        cursor = self.MysqlLinker.cursor()
        if(many is True):
            count = cursor.executemany(sqlSentence,args)
        else:
            count = cursor.execute(sqlSentence,args)
        self.TryCommit()
        return count

    #@IsRaiseError
    def CreateOrDelete(self,sqlSentence,args=()):
        cursor = self.MysqlLinker.cursor()
        cursor.execute(sqlSentence,args)
        self.TryCommit()
        return None


if  __name__ == '__main__':
    MysqlORM = MysqlDBOperation("localhost",3306,"root","yixueche","news_processor")
    MysqlORM.Connect()
    MysqlORM.CallPorcess("InsertApieceNews",("titletest","titlenopunc","urltest",time.strftime("%Y-%m-%d %H:%M:%S"),"adfasd0f","45t78dfg"))
    count = MysqlORM.InsertOrUpdate("INSERT into news_processor.newsdetails VALUE (%s,%s,%s,NULL,%s,NULL,%s,%s)",("titletest","titlenopunc","urltest",time.strftime("%Y-%m-%d %H:%M:%S"),"asdasd0f","45tdfg"))
    news = MysqlORM.Select("select * from newsdetails",None)

    print(count)
    print(news)
    print("OK!")