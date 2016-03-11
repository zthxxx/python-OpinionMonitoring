# -*- coding:utf-8 -*-
import hashlib


def HashDef(src):
    """
        生成md5的函数方法
    """
    m2 = hashlib.md5()
    m2.update(src)
    hash = m2.hexdigest()
    return hash

# print  HashDef("asas")

