# -*- coding: utf-8 -*-

from DataBaseOperation.MysqlDBOperation import MysqlDBOperation


class NewsProcessMysqlDBOperation(MysqlDBOperation):
    def SaveAPieceNews(self,Title = None,NoPunctuationTitle = None,Url = None,Summary = None,Time = None,isAccident = None,UrlHash = None,TitleHash = None):
        try:
            NoPunctuationTitle = NoPunctuationTitle.encode("utf-8")
            Url = Url.encode("utf-8")
            Title = Title.encode("utf-8")
        except:
            pass
        self.CallPorcess("InsertApieceNews",(Title,NoPunctuationTitle,Url,Summary,Time,isAccident,UrlHash,TitleHash))

















