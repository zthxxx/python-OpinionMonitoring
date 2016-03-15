# coding:utf-8
import sys
try:
    import urllib2
except ImportError:
    import urllib.request
import re
import gzip
import json
import time
from bs4 import BeautifulSoup
from HashTools import MD5Tools
try:
    from io import BytesIO as StringIO
except ImportError:
    try:
        from cStringIO import StringIO
    except ImportError:
        from StringIO import StringIO

reload(sys)
sys.setdefaultencoding('utf8')

class SpiderBase:
    def __init__(self):
        pass

    def __init__(self,seedUrl):
        self.seedUrl = seedUrl
        #self.NewsList = self.GetPageLinkUrls(self.seedUrl)
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

    def FormatTimeString(self, unformatTimeString, unformatTimeStyle):
        formatTime = time.strptime(unformatTimeString.encode("utf-8") ,unformatTimeStyle.encode("utf-8"))
        formatTimeString = time.strftime("%Y-%m-%d %H:%M:%S", formatTime).encode("utf-8")
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
    def GetNewsListTotal(self,NewsPageUrl):
        newsDictListTotal = []
        #try:
        htmlRaw = self.GetUrlResponseDecode(NewsPageUrl)
        newsHrefLists = self.FiltrateHrefRequiremnet(htmlRaw)
        newsDictList = self.NewsUrlsParser(newsHrefLists)
        newsDictListTotal.extend(newsDictList)
        #except:
        #   return None
        return newsDictListTotal




