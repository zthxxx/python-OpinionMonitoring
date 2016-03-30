# -*- coding: utf-8 -*-
import sys
import re
import time
import json
from bs4 import BeautifulSoup
from snownlp import SnowNLP
from SpiderModelPackage.HtmlDataSimpleAchieveModel import SpiderBase


class NewsSiChuanNewsZiGongSpider(SpiderBase):

    def GetPageLinkUrls(self,firstPageUrl):
        newsPageUrls = []
        newsPageUrls.append(firstPageUrl)
        firstPageUrl = firstPageUrl + r"system/more/0010003000000/0010003000000_"
        #TODO: range need to automatic.
        for PageIndex in range(1, 221)[::-1]:
            newsPageUrl = firstPageUrl + str(PageIndex) + ".htm"
            yield newsPageUrl

    def FiltrateHrefRequiremnet(self,htmlRaw):
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='utf-8')
        hrefListsSoup = htmlSoup.find("div", class_="listnews").find_all(href=re.compile(r"http://zg.newssc.org/system/+"))
        for hrefSoup in hrefListsSoup:
            unformatTimeString = hrefSoup.find_parent().find_next_sibling().string
            hrefSoup["time"] = self.FormatTimeString(unformatTimeString, "%Y-%m-%d %H:%M:%S")
        return hrefListsSoup

    def GetNewsUrlSummary(self,newsUrl):
        htmlRaw = self.GetUrlResponseDecode(newsUrl)
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='GBK')
        newsTextNode = htmlSoup.find("div",class_="newscontent")
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



