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

    def SelectTrainsetClassified(self,isAccident):
        result = self.Select(r"select nopunctitle from trainset where (isaccident = %s) ",(isAccident,))
        resultList = map(lambda nopunctitle:nopunctitle.get("nopunctitle",None) ,result)
        return resultList

    def InsertBayesVector(self,p0VectorList,p1VectorList,VocabularysList):
        self.CreateOrDelete("truncate news_processor.BayesVocabularyVector")
        for count, p0Vecrot in  enumerate(p0VectorList):
            self.CallPorcess("InsertBayesVector",(p0Vecrot,p1VectorList[count],VocabularysList[count]))

    def SelectBayesVector(self):
        result = self.CallPorcess("SelectBayesVector")
        p0VectorList = map(lambda vector:vector.get("P0Vector",None) ,result)
        p1VectorList = map(lambda vector:vector.get("P1Vector",None) ,result)
        VocabularysList = map(lambda vector:vector.get("Vocabulary",None) ,result)
        return p0VectorList,p1VectorList,VocabularysList











