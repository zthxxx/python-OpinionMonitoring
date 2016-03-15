# -*- coding:utf-8 -*-
import hashlib

def MD5HashString(string):
    md5Hashtor = hashlib.md5()
    try:
        md5Hashtor.update(string.encode("utf-8"))
        hash = md5Hashtor.hexdigest()
    except:
        hash = None
    return hash