# -*- coding: utf-8 -*-
import time
import dill
dill.detect.trace(True)
from multiprocessing.managers import BaseManager
from multiprocessing import freeze_support
try:
    import queue as Queue
except:
    import Queue

class ProcessingQueueNode():
    def __init__(self):
        self.queueManager = None

    def StartConnect(self, ServerAddress, port, password):
        if(self.queueManager == None):
            BaseManager.register('GetTaskQueue')
            BaseManager.register('GetResultQueue')
            queueManager = BaseManager(address=(ServerAddress, port), authkey=password)
            queueManager.connect()
            self.queueManager = queueManager

    def GetTaskQueue(self):
        taskqueue = self.queueManager.GetTaskQueue()
        return taskqueue

    def GetTaskQueuePop(self):
        taskqueue = self.queueManager.GetTaskQueue()
        if(taskqueue.qsize() > 0):
            return taskqueue.get()
        else:
            return None

    def GetTaskQueuePopBlock(self, timeout=None):
        taskqueue = self.queueManager.GetTaskQueue()
        return taskqueue.get(timeout=timeout)

    def PutResultQueue(self,object):
        resultQueue = self.queueManager.GetResultQueue()
        resultQueue.put(object)


if __name__ == '__main__':
    freeze_support()
    client = ProcessingQueueNode()
    client.StartConnect('127.0.0.1',5000,b'abc')

    for i in range(10):
        try:
            n = client.GetTaskQueuePopBlock()
            print('run task %d * %d...' % (n, n))
            r = '%d * %d = %d' % (n, n, n*n)
            time.sleep(1)
            client.PutResultQueue(r)
        except :
            print('task queue is empty.')

