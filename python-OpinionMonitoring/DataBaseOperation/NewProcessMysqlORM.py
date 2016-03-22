# -*- coding: utf-8 -*-

from DataBaseOperation.MysqlDBOperation import MysqlDBOperation


class Field(object):
    def __init__(self, name, column_type):
        self.name = name
        self.column_type = column_type

    def __str__(self):
        return '<%s:%s>' % (self.__class__.__name__, self.name)


class StringField(Field):
    def __init__(self, name):
        super(StringField, self).__init__(name, 'varchar(100)')

class IntegerField(Field):
    def __init__(self, name):
        super(IntegerField, self).__init__(name, 'int')

class DateTimeField(Field):
    def __init__(self, name):
        super(DateTimeField, self).__init__(name, 'datetime')

class DataBaseMetaclass(type):
    def __new__(cls, name, bases, attrs):
        if name=='DataBaseORMModel':
            return type.__new__(cls, name, bases, attrs)
        print('Found model: %s' % name)
        mappings = dict()
        for k, v in attrs.items():
            if isinstance(v, Field):
                print('Found mapping: %s ==> %s' % (k, v))
                mappings[k] = v
        for k in mappings.keys():
            attrs.pop(k)
        attrs['__mappings__'] = mappings # 保存属性和列的映射关系
        attrs['__table__'] = name # 假设表名和类名一致
        return type.__new__(cls, name, bases, attrs)

class DataBaseORMModel(dict):
    __metaclass__ = DataBaseMetaclass

    def __init__(self, **kw):
        super(DataBaseORMModel, self).__init__(**kw)

    def __getattr__(self, key):
        try:
            return self[key]
        except KeyError:
            raise AttributeError(r"'Model' object has no attribute '%s'" % key)

    def __setattr__(self, key, value):
        self[key] = value



if  __name__ == '__main__':
    mode = DataBaseORMModel()
    print("OK")


