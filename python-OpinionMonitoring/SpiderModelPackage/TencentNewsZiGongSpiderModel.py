# -*- coding: utf-8 -*-
import sys
import re
import time
from bs4 import BeautifulSoup
from HtmlDataSimpleAchieveModel import SpiderBase


class TencentNewsZiGongSpider(SpiderBase):

    def FiltrateHrefRequiremnet(self,htmlRaw):
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='utf-8')
        hrefListsSoup = htmlSoup.find("ul", class_="news_list_con").find_all(href=re.compile(r"http://cd.qq.com/a/+"))
        for hrefSoup in hrefListsSoup:
            unformatTimeString = hrefSoup.find_next_sibling().string
            hrefSoup["time"] = self.FormatTimeString(unformatTimeString, "%Y-%m-%d %H:%M:%S")
        return hrefListsSoup

    def GetNewsListTotal(self):
        newsDictListTotal = SpiderBase.GetNewsListTotal(self,self.seedUrl)
        return newsDictListTotal




