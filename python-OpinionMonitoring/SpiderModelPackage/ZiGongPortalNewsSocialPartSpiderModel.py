# -*- coding: utf-8 -*-
import sys
import re
import time
from bs4 import BeautifulSoup
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

    # def GetNewsListAndPutToQueue(self):
    #     newsDictListTotal = SpiderBase.GetNewsListAndPutToQueue(self,self.seedUrl)
    #     return newsDictListTotal

    def StartMonitor(self):
        SpiderBase.StartMonitor(self,self.seedUrl)



