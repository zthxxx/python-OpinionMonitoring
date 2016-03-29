# -*- coding:utf-8 -*-
from snownlp import SnowNLP
import bayes
import re
import sys
from numpy import *
import NewsCrewl
import DbProcess


reload(sys)
# 这里涉及windows的内部类处理机制。若是python生成的使用utf-8，若是手动复制生成的使用GBK
sys.setdefaultencoding('gbk')

def _TextSplit(news_text):
    """
        中文分词方法
    """
    news_text = unicode(news_text)
    s = SnowNLP(news_text)
    split_list = s.words
    return split_list

def _Title2Vec(news_text, dic_set):
    """
        向量化方法
    """
    split_list = _TextSplit(news_text)
    text_vec = bayes.setOfWords2Vec(dic_set, split_list)
    return text_vec

def _TrainSet():
    """
        建立测试集
    """
    docList=[]; classList=[]; fullText=[]

    accidentNews = DbProcess.DbRead2("1")
    normalNews = DbProcess.DbRead2("0")

    for news_title in accidentNews:
        wordList = _TextSplit(news_title)
        docList.append(wordList)
        fullText.extend(wordList)
        classList.append(1)

    for news_title in normalNews:
        wordList = _TextSplit(news_title)
        docList.append(wordList)
        fullText.extend(wordList)
        classList.append(0)

    vocabList = bayes.createVocabList(docList)  # 去重操作&成为字典

    trainMat = []

    for postingDoc in docList:
        trainMat.append(bayes.setOfWords2Vec(vocabList, postingDoc))
    p0V, p1V, pAb = bayes.trainNB0(trainMat, classList)
    # print "p0V=",p0V # 属于0类（正常类）的概率向量
    # print "p1V=",p1V # 属于1类（事故类）的概率向量
    # print "pAb=",pAb # 在事件集中属于1类的概率
    return p0V, p1V, pAb,vocabList

def BayesClassify(input,p0V, p1V, pAb,vocabList):
    # path_accident = "accident.txt"
    # path_normal = "normal.txt"
    # p0V, p1V, pAb ,vocabList= _TrainSet(path_accident, path_normal) # 产生训练集向量
    input = NewsCrewl.removePunctuation(input)
    news_text = unicode(input)
    input_word = _TextSplit(news_text)
    vec2Classify = []
    vec2Classify.append(bayes.setOfWords2Vec(vocabList, input_word))
    Newstype = bayes.classifyNB(vec2Classify,p0V,p1V,pAb) # 进行分类

    if Newstype == 1:
        return "事故类"
    else:
        return "普通类"



p0V, p1V, pAb,vocabList = _TrainSet()
print BayesClassify("#少年用假钞骗老人#后逃跑 老人追逐时摔倒身亡",p0V, p1V, pAb, vocabList)