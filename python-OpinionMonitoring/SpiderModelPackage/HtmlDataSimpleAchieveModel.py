# coding:utf-8
import sys
import re
import gzip
import json
import time
import itertools
from bs4 import BeautifulSoup
from HashTools import MD5Tools
try:
    import queue as Queue
except:
    import Queue
try:
    import urllib2
except ImportError:
    import urllib.request as urllib2
try:
    from io import BytesIO as StringIO
except ImportError:
    try:
        from cStringIO import StringIO
    except ImportError:
        from StringIO import StringIO
from ServerClientSocket.ProcessingQueueNode import ProcessingQueueNode


class SpiderBase:
    def __init__(self):
        pass

    def __init__(self,seedUrl):
        self.seedUrl = seedUrl
        self.newsQueue = Queue.Queue()
        self.spiderClawNode = None
        #self.NewsUrlsList = self.GetPageLinkUrls(self.seedUrl)
        pass

    def ConnectServer(self, ServerAddress, port, password):
        if(self.spiderClawNode == None):
            spiderClawNode = ProcessingQueueNode()
            spiderClawNode.StartConnect(ServerAddress, port, password)
            self.spiderClawNode = spiderClawNode

    #TODO: Abstract method to get the iterable list of urls which wait to travers.
    def GetPageLinkUrls(self,firstPageUrl):
        pass
        return firstPageUrl

    def RemovePunctuation(self,punctuationText):
        punctuation = "[\s+\.\!\/_,$%^*(+\"\']+|[A-Za-z0-9+——！“”''‘’""，。()？、~@#￥%……&*（）:：《》(图)]+"
        NoPunctuationText = re.sub(punctuation, "", punctuationText)
        return NoPunctuationText

    def TryDecodeText(self,text):
        try:
            text = unicode(text).encode('utf8')
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
        headers = {'User-Agent':'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/30.0.1599.114 Chrome/30.0.1599.114 Safari/537.36','Accept-encoding':'gzip'}
        request = urllib2.Request(url, headers = headers)
        response = urllib2.urlopen(request,timeout = 30)
        responseRead = response.read()
        responseUnzip = self.DecompressGzip(responseRead)
        responseReadDecode = self.TryDecodeText(responseUnzip)
        return responseReadDecode

    def FormatTimeString(self, unformatTimeString, unformatTimeStyle):
        formatTime = time.strptime(unformatTimeString ,unformatTimeStyle)
        formatTimeString = time.strftime("%Y-%m-%d %H:%M:%S", formatTime)
        return formatTimeString

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

    #Give a url and get response news list in accordance with the rules at FiltrateHrefRequirement.
    def GetNewsListTotal(self ,NewsPageUrl):
        try:
            htmlRaw = self.GetUrlResponseDecode(NewsPageUrl)
            newsHrefLists = self.FiltrateHrefRequiremnet(htmlRaw)
            newsDictList = self.NewsUrlsParser(newsHrefLists)
        except:
            return None
        return newsDictList

    def GetNewsListAndPutToQueue(self ,seedUrl):
        newsDictListTotal = self.GetNewsListTotal(seedUrl)
        if(isinstance(self.spiderClawNode,ProcessingQueueNode)):
                self.spiderClawNode.PutResultQueue(newsDictListTotal)
        return newsDictListTotal



