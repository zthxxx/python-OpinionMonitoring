# -*- coding: utf-8 -*-
import sys
import re
import time
from bs4 import BeautifulSoup
from HtmlDataSimpleAchieveModel import SpiderBase


class TencentNewsChengDuSpider(SpiderBase):

    def GetPageLinkUrls(self,firstPageUrl):
        suffixHtmRule = "(\.htm)$"
        firstPageUrl = re.sub(suffixHtmRule,"",firstPageUrl)
        newsPageUrls = []
        newsPageUrls.append(firstPageUrl + ".htm")
        #TODO: range need to automatic.
        for PageIndex in range(2, 135):
            newsPageUrl = firstPageUrl + "_" + str(PageIndex) + ".htm"
            yield newsPageUrl

    def FiltrateHrefRequiremnet(self,htmlRaw):
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='utf-8')
        hrefListsSoup = htmlSoup.find("div", class_="leftList").find_all(href=re.compile(r"http://cd.qq.com/a/+"))
        for hrefSoup in hrefListsSoup:
            newsUrl = hrefSoup.get("href")
            newsYear = str(re.findall(r"http://cd.qq.com/a/(\d{4}.*?)\d*/",newsUrl,re.S)[0]) + "年"
            unformatTimeString = hrefSoup.find_next_sibling().string
            try:
                unformatTimeString = unicode(unformatTimeString).encode("utf-8")
            except:
                pass
            unformatTimeString = newsYear + unformatTimeString
            hrefSoup["time"] = self.FormatTimeString(unformatTimeString, "%Y年%m月%d日 %H:%M")
        return hrefListsSoup

    def GetNewsListTotal(self):
        newsDictListTotal = SpiderBase.GetNewsListTotal(self,self.seedUrl)
        return newsDictListTotal

if  __name__ == '__main__':
    spiderTencentChengDuNews = TencentNewsChengDuSpider(r"http://cd.qq.com/l/news/newshot/list2013071194632.htm")
    print(spiderTencentChengDuNews.GetNewsListTotal())