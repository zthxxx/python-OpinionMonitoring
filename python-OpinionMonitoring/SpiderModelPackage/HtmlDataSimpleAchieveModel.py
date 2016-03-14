#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import urllib2
import re
import gzip
import json
from bs4 import BeautifulSoup
from StringIO import StringIO
from HashTools import MD5Tools

reload(sys)
sys.setdefaultencoding('utf8')


class SpiderBase:
    def __init__(self):
        pass

    #TODO: Abstract method to get the iterable list of urls which wait to travers.
    def GetPageLinkUrls(self,firstPageUrl):
        pass
        return None

    def RemovePunctuation(self,punctuationText):
        punctuation = "[\s+\.\!\/_,$%^*(+\"\']+|[A-Za-z0-9+——！“”''‘’""，。()？、~@#￥%……&*（）:：《》(图)]+"
        NoPunctuationText = re.sub(punctuation.decode("utf8"), "".decode("utf8"), punctuationText.decode("utf8"))
        return NoPunctuationText

    def TryDecodeText(self,text):
        try:
            text = text.decode('GB2312').encode('utf8')
        except:
            try:
                text = text.encode('utf8')
            except:
                pass
        return text

    def DecompressGzip(self,data) :
        compressedStream = StringIO(data)
        gziper = gzip.GzipFile(fileobj  = compressedStream)
        try:
            decodeData = gziper.read()   # 读取解压缩后数据
        except:
            decodeData = data
        return decodeData

    def GetUrlResponseDecode(self,url):
        headers = {'User-Agent':'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/30.0.1599.114 Chrome/30.0.1599.114 Safari/537.36'}
        request = urllib2.Request(url, headers = headers)
        request.add_header('Accept-encoding', 'gzip')
        response = urllib2.urlopen(request,timeout = 30)
        responseRead = response.read()
        responseUnzip = self.DecompressGzip(responseRead)
        responseReadDecode = self.TryDecodeText(responseUnzip)
        return responseReadDecode

        #TODO: Abstract method to get soup object with urls which you need.
        #TODO: The return soup must have text part, href, and time.
        #TODO: This like <a href="http://..." target="_blank" time="20xx-xx-xx xx:xx:xx">...</a>
    def FiltrateHrefRequiremnet(self,htmlRaw):
        htmlSoup = BeautifulSoup(htmlRaw, 'html.parser', from_encoding='utf-8')
        hrefListsSoup = htmlSoup.find_all(href=re.compile(r"http://+"))
        return hrefListsSoup

    #Result is a list of dict object ,each dict have the 'Title', 'NoPunctuationTitle', 'Url', 'TitleHash', 'UrlHash', and 'Time'.>
    def NewsUrlsParser(self,hrefListsSoup):
        newsDictList = []
        for hrefSoup in hrefListsSoup:
            newsTitle = hrefSoup.string
            newsNoPunctuationTitle = self.RemovePunctuation(newsTitle)
            newsUrl = hrefSoup.get("href")
            aPieceOfNews = dict()
            aPieceOfNews["Title"] = newsTitle
            aPieceOfNews["NoPunctuationTitle"] = newsNoPunctuationTitle
            aPieceOfNews["Url"] = newsUrl
            aPieceOfNews["TitleHash"] = MD5Tools.MD5HashString(newsNoPunctuationTitle)
            aPieceOfNews["UrlHash"] = MD5Tools.MD5HashString(newsUrl)
            aPieceOfNews["Time"] = hrefSoup.get("time")
            newsDictList.append(aPieceOfNews)
        return newsDictList

    #Give a url and get response news list in accordance with the rules at FiltrateHrefRequiremnet.
    def GetNewsListTotal(self,NewsPageUrl):
        newsDictListTotal = []
        try:
            htmlRaw = self.GetUrlResponseDecode(NewsPageUrl)
            newsHrefLists = self.FiltrateHrefRequiremnet(htmlRaw)
            newsDictList = self.NewsUrlsParser(newsHrefLists)
            newsDictListTotal.extend(newsDictList)
        except:
            return None
        return newsDictListTotal




