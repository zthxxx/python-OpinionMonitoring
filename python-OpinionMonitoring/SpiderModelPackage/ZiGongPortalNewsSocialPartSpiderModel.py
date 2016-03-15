# -*- coding: utf-8 -*-
import sys
import re
import time
from bs4 import BeautifulSoup
from HtmlDataSimpleAchieveModel import SpiderBase


class ZiGongPortalNewsSocialPartSpider(SpiderBase):

    def FiltrateHrefRequiremnet(self,htmlRaw):
        textReRule = r'.+'
        htmlSoup = BeautifulSoup(htmlRaw.encode("utf-8"), 'html.parser', from_encoding='utf-8')
        hrefListsSoup = htmlSoup.find("div",class_="list-news-l").find_all(href=re.compile(r"http://www.zgm.cn/html/a/+"),text=re.compile(textReRule))
        for hrefSoup in hrefListsSoup:
            unformatTimeString = hrefSoup.find_next_siblings()[-1]
            unformatTimeString = unformatTimeString.find("span").string
            hrefSoup["time"] = self.FormatTimeString(unformatTimeString, "%Y-%m-%d")
        return hrefListsSoup

    def GetNewsListTotal(self):
        newsDictListTotal = SpiderBase.GetNewsListTotal(self,self.seedUrl)
        return newsDictListTotal




