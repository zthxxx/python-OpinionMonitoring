# -*- coding:utf-8 -*-
import urllib2
import re
from bs4 import BeautifulSoup
import sys
import os

reload(sys)
sys.setdefaultencoding('utf8')

# def _saveList2txt(fileName, variableName):
#     f = open(fileName+'.txt', 'w')
#     for i in variableName:
#         f.write(i+"\n")
#     f.close()

def removePunctuation(text):
    punctuation = "[\s+\.\!\/_,$%^*(+\"\']+|[+——！“”''‘’""，。()？、~@#￥%……&*（）:：《》(图)]+"
    mytext = re.sub(punctuation.decode("utf8"), "".decode("utf8"), text.decode("utf-8"))
    return mytext

def _GetUrl():
    news_urls = []
    news_urls.append("http://cd.qq.com/l/news/newshot/list2013071194632.htm")
    for index in range(2, 135):
        news_url = "http://cd.qq.com/l/news/newshot/list2013071194632"+"_"+str(index)+".htm"
        news_urls.append(news_url)
    return news_urls

def _GetResponse(url):
    headers = {'User-agent': 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'}
    request = urllib2.Request(url, headers=headers)
    response = urllib2.urlopen(request, timeout=10)
    url_read = response.read()
    url_cont = url_read.decode('GBK').encode('utf8')    # 将网页从GBK解码为utf-8
    return url_cont

def _NewsSoup(html_cont):
    soup = BeautifulSoup(html_cont, 'html.parser', from_encoding='utf-8')
    lists = soup.find("div", class_="leftList").find_all(href=re.compile(r"http://cd.qq.com/a/+"))
    return lists

def _newsParser(soup):
    news_title = []
    news_nopuntitle = []
    news_url = []

    for news in soup:
        title = news.get_text()
        title_NoPun = removePunctuation(title)
        web = news["href"]
        news_nopuntitle.append(title_NoPun)
        news_title.append(title)
        news_url.append(web)
    return news_title, news_nopuntitle, news_url


def NewsCrewlMain():
    NewsList = _GetUrl()
    news_titles = []
    news_urls =[]
    news_nopuntitles = []

    for index in range(1, 2):
        # NewsUrl = NewsList.pop()
        NewsUrl = "http://cd.qq.com/l/news/newshot/list2013071194632.htm"
        # print "开始抓取 : " + NewsUrl
        try:
            html_cont = _GetResponse(NewsUrl)
            news_lists = _NewsSoup(html_cont)
            news_title, news_nopuntitle, news_url = _newsParser(news_lists)

            news_titles = news_titles + news_title
            news_nopuntitles = news_nopuntitles + news_nopuntitle
            news_urls = news_urls + news_url
            # print "已完成对该页面的抓取 ","抓取总新闻数：", len(news_titles)
        except:
            print "链接失效了~"
    return news_titles, news_nopuntitles, news_urls

news_titles, news_nopuntitles, news_urls = NewsCrewlMain()
print news_titles, news_nopuntitles, news_urls