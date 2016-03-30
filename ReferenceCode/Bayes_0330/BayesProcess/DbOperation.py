# -*- coding:utf-8 -*-
import MySQLdb

def DbRead(isaccident):
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
    cursor.execute(sql_read)
    conn.commit()

    re = cursor.fetchall()
    for npct in re:
        nopunctitle.append(npct[2])
    cursor.close()
    conn.close()
    return nopunctitle