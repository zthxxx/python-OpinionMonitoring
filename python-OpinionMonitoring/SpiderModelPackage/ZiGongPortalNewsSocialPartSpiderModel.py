# -*- coding: utf-8 -*-
import sys
import re
import time
import json
from bs4 import BeautifulSoup
from snownlp import SnowNLP
from SpiderModelPackage.HtmlDataSimpleAchieveModel import SpiderBase


class ZiGongPortalNewsSocialPartSpider(SpiderBase):

    def FiltrateHrefRequiremnet(self,htmlRaw):
        textReRule = r'.+'
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='utf-8')
        hrefListsSoup = htmlSoup.find("div",class_="list-news-l").find_all(href=re.compile(r"http://www.zgm.cn/html/a/+"),text=re.compile(textReRule))
        for hrefSoup in hrefListsSoup:
            unformatTimeString = hrefSoup.find_next_siblings()[-1]
            unformatTimeString = unformatTimeString.find("span").string
            hrefSoup["time"] = self.FormatTimeString(unformatTimeString, "%Y-%m-%d")
        return hrefListsSoup

    def GetNewsUrlSummary(self,newsUrl):
        htmlRaw = self.GetUrlResponseDecode(newsUrl)
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='GBK')
        newsTextNode = htmlSoup.find("div",class_="a3")
        newsTextNodes = newsTextNode.find_all("p")
        newsText = " ".join(map(lambda node : node.get_text(),newsTextNodes))
        try:
            newsText = unicode(newsText)
        except:
            pass
        snow = SnowNLP(newsText)
        mainText = snow.summary(3)
        return " ".join(mainText)

    def StartMonitor(self):
        SpiderBase.StartMonitor(self,self.seedUrl)



