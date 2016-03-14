#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import random, time, queue
import dill
from multiprocessing import freeze_support
from multiprocessing.managers import BaseManager

dill.detect.trace(True)
# 发送任务的队列:
task_queue = queue.Queue()
# 接收结果的队列:
result_queue = queue.Queue()

# 从BaseManager继承的QueueManager:
class QueueManager(BaseManager):
    pass

def return_task_queue():
    return task_queue

def return_result_queue():
    return result_queue

def test():
    global task_queue
    global result_queue
    # 把两个Queue都注册到网络上, callable参数关联了Queue对象:
    BaseManager.register('get_task_queue', callable=return_task_queue)
    BaseManager.register('get_result_queue', callable=return_result_queue)

    # 绑定端口5000, 设置验证码'abc':
    manager = BaseManager(address=('127.0.0.1', 5000), authkey=b'abc')
    # 启动Queue:
    manager.start()

    # 获得通过网络访问的Queue对象:
    task = manager.get_task_queue()
    result = manager.get_result_queue()
    # 放几个任务进去:
    for i in range(10):
        n = random.randint(0, 10000)
        print('Put task %d...' % n)
        task.put(n)
    # 从result队列读取结果:
    print('Try get results...')
    for i in range(10):
        r = result.get(timeout=10)
        print('Result: %s' % r)
    # 关闭:
    manager.shutdown()
    print('master exit.')

if __name__ == '__main__':

    freeze_support()
    test()