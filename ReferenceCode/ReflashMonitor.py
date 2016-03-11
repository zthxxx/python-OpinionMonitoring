# -*- coding:utf-8 -*-
import time
import NewsCrewl
import OtherTools
import sys

reload(sys)
sys.setdefaultencoding('utf-8')

def Monitor():
    old_list = []
    news_titles, news_nopuntitles, old_news_urls = NewsCrewl.NewsCrewlMain()
    old_list = old_news_urls
    count = 0
    while True:
        try:
            count = count + 1
            print count
            news_titles, news_nopuntitles, new_news_urls = NewsCrewl.NewsCrewlMain()
            new_list = new_news_urls
            # print new_list
            if new_list == old_list:
                old_list = new_list
            else:
                for url in new_list:
                    if url not in old_list:
                        # OtherTools.creatfram(url)
                        print url
                old_list = new_list
            time.sleep(3)
        except:
            continue

Monitor()
