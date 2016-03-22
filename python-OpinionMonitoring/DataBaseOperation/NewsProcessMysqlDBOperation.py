# -*- coding: utf-8 -*-

from DataBaseOperation.MysqlDBOperation import MysqlDBOperation


class NewsProcessMysqlDBOperation(MysqlDBOperation):
    def SaveAPieceNews(self,Title = None,NoPunctuationTitle = None,Url = None,Time = None,TitleHash = None,UrlHash = None):
        try:
            NoPunctuationTitle = NoPunctuationTitle.encode("utf-8")
            Url = Url.encode("utf-8")
            Title = Title.encode("utf-8")
        except:
            pass
        self.CallPorcess("InsertApieceNews",(Title,NoPunctuationTitle,Url,Time,UrlHash,TitleHash))

















