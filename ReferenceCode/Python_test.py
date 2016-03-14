#encoding:UTF-8
import urllib.request
import urllib.parse
import json
import re
import socket

from collections import deque

Debug_Flag = 1
Text_File_Path = 'yiban_report.txt'
articleId = 0
channel_id = 0
puid = 0
OldComment = ""
Deque_Str_Cash = ""
Deque_Str_Cash_Count = 0 
commentCount = 0
school_id = 5000090
scroll_count = 0
yiban_school_page = 1
jsComments_Cash = deque()
headers = {'User-Agent':'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/30.0.1599.114 Chrome/30.0.1599.114 Safari/537.36'}
post_values = {'channel_id':channel_id,'puid':puid,'article_id':articleId,'size':commentCount} 
post_url = 'http://www.yiban.cn/forum/reply/listAjax'
yiban_school_url = 'http://www.yiban.cn/square/index/page/' + str(yiban_school_page)
socket.setdefaulttimeout(7)

f_obj = open(Text_File_Path, 'w') # w覆盖打开 清空原爬虫数据
f_obj.close()

def saveFile(File_Path,data):
    save_path = File_Path
    f_obj = open(File_Path, 'a') # a 表示追加打开
    f_obj.write(data)
    f_obj.close()

def Is_Try_Response_Crash(url):
    global response
    try:
        response = urllib.request.urlopen(url,timeout = 7)
    except:
        try:
            response = urllib.request.urlopen(url,timeout = 7)
        except:
            return True
    return False

def Is_Try_Decode_Crash():
    global the_page,response,Debug_Flag
    try:
        the_page = response.read().decode("utf8")
    except:
        if(Debug_Flag):
            print('不需要解码 !!!')   
        return True
    return False


for yiban_school_page in range(1,83+1):
    yiban_school_url = 'http://www.yiban.cn/square/index/page/' + str(yiban_school_page)     
    if Is_Try_Response_Crash(yiban_school_url):continue  
    if Is_Try_Decode_Crash():continue
    school_id = (re.findall('<a target="_blank" href="/school/index/id/(\d+)',the_page,re.S))
    for each_school_id in school_id:
        if(Debug_Flag):print('THE School is :   '+ str(each_school_id))            
        scroll_count = 1
        while True :
            url = 'http://www.yiban.cn/school/getDataAjax?id=' + str(each_school_id) + '&scroll='+ str(scroll_count)
            if Is_Try_Response_Crash(url):continue         
            if Is_Try_Decode_Crash():continue
            if(Debug_Flag):print('each_school_id =  '+ str(each_school_id))                
            jsDict = json.loads(the_page)
            jsData = jsDict['data']
            if(jsData == ""):
                if(Debug_Flag):print('完成一个学校')                    
                break
            get_url = re.findall('href=\"(http://www.yiban.cn/forum/schoolAd/articleShow/id/\d+)\">',jsData,re.S)
            if(Debug_Flag):print('scroll = '+ str(scroll_count))                
            for each_url in get_url:
                if Is_Try_Response_Crash(each_url):continue
                if(Debug_Flag):print('Is Responsing !!!')                    
                if Is_Try_Decode_Crash():continue
                if(Debug_Flag):print('Is Read the Page !!!')                    
                channel_id = re.findall('channel_id = (\d+)',the_page,re.S)
                puid = re.findall('puid = (\d+)',the_page,re.S)
                articleId = re.findall('articleId = (\d+)',the_page,re.S)
                commentCount  = re.findall('commentCount=\"(\d+)\"',the_page,re.S)
                if(len(channel_id)==0):continue                    
                if(Debug_Flag):
                    try:
                        print('channel_id = '+channel_id[0])
                        print('puid = '+puid[0])
                        print('articleId = '+articleId[0])
                        print('commentCount = '+commentCount[0])
                    except:
                        continue
                if(commentCount[0] == '0'):continue                    
                post_values = {'channel_id':channel_id[0],'puid':puid[0],'article_id':articleId[0],'size':commentCount[0]}
                data = urllib.parse.urlencode(post_values).encode(encoding='UTF8')
                req = urllib.request.Request(post_url,data,headers)
                if Is_Try_Response_Crash(req):continue
                if Is_Try_Decode_Crash():continue
                jsDict = json.loads(the_page)
                jsData = jsDict['data'] 
                jsList = jsData['list']
                jsCommentNum = 0
                OldComment = ""
                for jsCommentNum in range(0,int(commentCount[0])+1):     
                    try:
                        jsListNum  = jsList[str(jsCommentNum)]
                    except:
                        break
                    jsComments = jsListNum['content']
                    jsComments_Filter_1 = re.sub('<img.*?/>','',jsComments,re.S)
                    jsComments_Filter_2 = re.sub('(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?',' ',jsComments_Filter_1,re.S)
                    jsComments_Filter_3 = re.sub('^\s*','',jsComments_Filter_2,re.S)
                    jsComments_Filter_4 = re.sub('\s*$','',jsComments_Filter_3,re.S)
                    jsComments_Filter_End = jsComments_Filter_4
                    if(jsComments_Filter_End == ''):continue                        
                    if(OldComment != jsComments_Filter_End):
                        try:
                            print(jsComments_Filter_End)  
                            Deque_Str_Cash += jsComments_Filter_End +'\r\n'
                            Deque_Str_Cash_Count += 1
                            if(Deque_Str_Cash_Count > 10):
                                saveFile(Text_File_Path,Deque_Str_Cash)
                                Deque_Str_Cash_Count = 0
                                Deque_Str_Cash = ''
                        except:
                            continue
                        OldComment = jsComments_Filter_End
                    jsCommentNum+=1
            scroll_count+=1
