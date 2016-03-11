# -*- coding:utf-8 -*-
import MySQLdb

def DBSave1(title, nopuntitle, url, summary, time, isaccident, hash):
    """
        数据库存储方法 表:newsdetails
    """
    conn = MySQLdb.connect(host='127.0.0.1',
                           port=3306,
                           user='root',
                           passwd='root',
                           db='news_processor',
                           charset='utf8'
                           )

    cursor = conn.cursor()
    sql_insert = "insert into newsdetails(title, nopuntitle, url, summary, time, isaccident, hash) \
    values('"+title+"','"+nopuntitle+"','"+url+"','"+summary+"','"+time+"','"+isaccident+"','"+hash+"')"

    print sql_insert

    cursor.execute(sql_insert)
    conn.commit()

    cursor.close()
    conn.close()


# DBSave1("拉拉阿拉","拉拉阿拉","www.aaa.com","拉拉阿拉","2012/1/1 12:11:11","1","baa7a52965b99778f38ef37f235e9053")

def DBSave2(ctitle, nopunctitle, isaccident):
    """
        数据库存储方法 表:trainset
    """
    conn = MySQLdb.connect(host='127.0.0.1',
                           port=3306,
                           user='root',
                           passwd='root',
                           db='news_processor',
                           charset='utf8'
                           )
    cursor = conn.cursor()

    sql_insert = "insert into trainset(ctitle, nopunctitle, isaccident) \
    values('"+ctitle+"','"+nopunctitle+"','"+isaccident+"')"
    print sql_insert

    cursor.execute(sql_insert)
    conn.commit()

    cursor.close()
    conn.close()

# DBSave2("拉拉阿拉","拉拉阿拉","1")

def DbRead2(isaccident):
    """
        数据库读取方法保存为某一类的list 表:trainset
        0类是普通类；1类是事故类
    """
    nopunctitle = []
    conn = MySQLdb.connect(host='127.0.0.1',
                           port=3306,
                           user='root',
                           passwd='root',
                           db='news_processor',
                           charset='utf8'
                           )
    cursor = conn.cursor()
    sql_read = "select * from trainset where (isaccident = "+isaccident+")"
    print sql_read
    cursor.execute(sql_read)
    conn.commit()

    re = cursor.fetchall()
    for npct in re:
        # print npct[2]
        nopunctitle.append(npct[2])

    cursor.close()
    conn.close()
    return nopunctitle

# print DbRead2("0")