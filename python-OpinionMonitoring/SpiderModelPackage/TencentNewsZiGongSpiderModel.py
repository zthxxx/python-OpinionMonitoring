# -*- coding: utf-8 -*-
import sys
import re
import time
import json
from bs4 import BeautifulSoup
from snownlp import SnowNLP
from SpiderModelPackage.HtmlDataSimpleAchieveModel import SpiderBase


class TencentNewsZiGongSpider(SpiderBase):

    def FiltrateHrefRequiremnet(self,htmlRaw):
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='utf-8')
        hrefListsSoup = htmlSoup.find("ul", class_="news_list_con").find_all(href=re.compile(r"http://cd.qq.com/a/+"))
        for hrefSoup in hrefListsSoup:
            unformatTimeString = hrefSoup.find_next_sibling().string
            hrefSoup["time"] = self.FormatTimeString(unformatTimeString, "%Y-%m-%d %H:%M:%S")
        return hrefListsSoup

    def GetNewsUrlSummary(self,newsUrl):
        htmlRaw = self.GetUrlResponseDecode(newsUrl)
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='GBK')
        newsTextNode = htmlSoup.find_all("p",style="TEXT-INDENT: 2em")
        if(len(newsTextNode) == 0):
            suffixHtmRule = "(\.htm)$"
            jsAjaxUrl = re.sub(suffixHtmRule,".hdBigPic.js",newsUrl)
            htmlRaw = self.GetUrlResponseDecode(jsAjaxUrl)
            htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='GBK')
            newsTextNode = htmlSoup.find_all("p")
        newsText = " ".join(map(lambda node : node.get_text(),newsTextNode))
        try:
            newsText = unicode(newsText)
        except:
            pass
        snow = SnowNLP(newsText)
        mainText = snow.summary(3)
        return " ".join(mainText)


    def StartMonitor(self):
        SpiderBase.StartMonitor(self,self.seedUrl)




