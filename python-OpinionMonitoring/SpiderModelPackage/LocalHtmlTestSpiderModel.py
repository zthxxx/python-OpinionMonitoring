# -*- coding: utf-8 -*-
import sys
import re
import time
from bs4 import BeautifulSoup
from SpiderModelPackage.HtmlDataSimpleAchieveModel import SpiderBase


class LocalHtmlTestSpider(SpiderBase):

    def FiltrateHrefRequiremnet(self,htmlRaw):
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='utf-8')
        hrefListsSoup = htmlSoup.find("table", class_="table").find_all(href=re.compile(r"http://+"),target="view_window")
        for hrefSoup in hrefListsSoup:
            unformatTimeString = hrefSoup.find_parent().find_next_sibling().find_next_sibling().string
            try:
                unformatTimeString = unicode(unformatTimeString).encode("utf-8")
            except:
                pass
            hrefSoup["time"] = self.FormatTimeString(unformatTimeString, "%Y-%m-%d %H:%M:%S.%f")
        return hrefListsSoup

    def GetNewsUrlSummary(self,newsUrl):
        return "dfa"

    def StartMonitor(self):
        SpiderBase.StartMonitor(self,self.seedUrl)















