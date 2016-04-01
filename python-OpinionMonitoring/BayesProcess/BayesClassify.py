# -*- coding:utf-8 -*-
from snownlp import SnowNLP
import BayesBase
import json
import re
import sys
import numpy
from  DataBaseOperation.NewsProcessMysqlDBOperation import NewsProcessMysqlDBOperation


class BayesClassify():
    def __init__(self,p0Vector=None, p1Vector=None, pAb=None,vocabularies=None):
        if(isinstance(p0Vector,list)):
            p0Vector = numpy.array(p0Vector)
        if(isinstance(p1Vector,list)):
            p1Vector = numpy.array(p1Vector)
        self.p0Vector = p0Vector
        self.p1Vector = p1Vector
        self.pAb = pAb
        self.vocabularies = vocabularies


    def _TextSplit(self, news_text):
        """
            中文分词方法
        """
        news_text = unicode(news_text)
        s = SnowNLP(news_text)
        split_list = s.words
        return split_list

    def _Title2Vec(self,news_text, dic_set):
        """
            向量化方法
        """
        split_list = self._TextSplit(self,news_text)
        text_vec = bayes.setOfWords2Vec(dic_set, split_list)
        return text_vec

    def _TrainSet(self,accidentNews,normalNews):
        """
            建立测试集
        """
        docList=[]; classList=[]; fullText=[]
        # TODO rebulid the method of DB operation


        for news_title in accidentNews:
            wordList = self._TextSplit(news_title)
            docList.append(wordList)
            fullText.extend(wordList)
            classList.append(1)

        for news_title in normalNews:
            wordList = self._TextSplit(news_title)
            docList.append(wordList)
            fullText.extend(wordList)
            classList.append(0)

        vocabList = BayesBase.createVocabList(docList)  # 去重操作&成为字典

        trainMat = []

        for postingDoc in docList:
            trainMat.append(BayesBase.setOfWords2Vec(vocabList, postingDoc))
        p0V, p1V, pAb = BayesBase.trainNB0(trainMat, classList)
        # print vocabList
        return p0V, p1V, pAb,vocabList  # len(vocabList)应该是1305

    def BayesOperation(self,input):

        news_text = input
        input_word = self._TextSplit(news_text)
        vec2Classify = []
        vec2Classify.append(BayesBase.setOfWords2Vec(self.vocabularies, input_word))
        Newstype = BayesBase.classifyNB(vec2Classify,self.p0Vector,self.p1Vector,self.pAb) # 进行分类
        return Newstype


if  __name__ == '__main__':
    bayes = BayesClassify()
    p0V, p1V, pAb,vocabList = bayes._TrainSet()
    # NPlist = p0V.tolist()
    # print NPlist
    print bayes.BayesOperation(u"日绵阳平武气温提升大地依旧被厚厚冰雪覆盖",p0V, p1V, pAb,vocabList)