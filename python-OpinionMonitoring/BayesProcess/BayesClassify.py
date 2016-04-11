# -*- coding:utf-8 -*-
from snownlp import SnowNLP
from  BayesProcess import BayesBase
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
        split_list = self._TextSplit(news_text)
        text_vec = BayesBase.setOfWords2Vec(dic_set, split_list)
        return text_vec

    def TrainSet(self,accidentNews,normalNews):
        """
            建立测试集
        """
        docList=[]
        classList=[]
        vocabularies=set()
        trainMat = []
        # TODO rebulid the method of DB operation


        for news_title in accidentNews:
            wordList = self._TextSplit(news_title)
            docList.append(wordList)
            vocabularies = vocabularies | set(wordList)
            classList.append(1)

        for news_title in normalNews:
            wordList = self._TextSplit(news_title)
            docList.append(wordList)
            vocabularies = vocabularies | set(wordList)
            classList.append(0)

        vocabularyList = list(vocabularies)
        for postingDoc in docList:
            trainMat.append(BayesBase.bagOfWords2Vec(vocabularyList, postingDoc))
        p0V, p1V = BayesBase.trainNB0(trainMat, classList)
        return p0V, p1V,vocabularyList  # len(vocabList)应该是1305

    def BayesClassifyOperation(self, input):
        news_text = input
        input_word = self._TextSplit(news_text)
        vec2Classify = []
        vec2Classify.append(BayesBase.bagOfWords2Vec(self.vocabularies, input_word))
        Newstype = BayesBase.classifyNB(vec2Classify,self.p0Vector,self.p1Vector,self.pAb) # 进行分类
        return Newstype

