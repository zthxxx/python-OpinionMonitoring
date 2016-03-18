# -*- coding: utf-8 -*-
import dill
dill.detect.trace(True)
from multiprocessing.managers import BaseManager
from multiprocessing import freeze_support
freeze_support()
try:
    import queue as Queue
except:
    import Queue


_ProcessingQueueManagerTaskQueue = Queue.Queue()
_ProcessingQueueManagerResultQueue = Queue.Queue()

def _ProcessingQueueManagerReturnTaskQueue():
    return _ProcessingQueueManagerTaskQueue

def _ProcessingQueueManagerReturnResultQueue():
    return _ProcessingQueueManagerResultQueue


class ProcessingQueueManager():

    def __init__(self):
        self.queueManager = None
        self.taskQueue = Queue.Queue()
        self.resultQueue = Queue.Queue()

    def __del__(self):
        if(self.queueManager != None):
            self.CloseManager()

    def ReturnTaskQueue(self):
        return self.taskQueue

    def ReturnResultQueue(self):
        return self.resultQueue

    def StartManager(self, IPAddress, port, password):
        if(self.queueManager == None):
            BaseManager.register('GetTaskQueue', callable=_ProcessingQueueManagerReturnTaskQueue)
            BaseManager.register('GetResultQueue', callable=_ProcessingQueueManagerReturnResultQueue)
            queueManager = BaseManager(address=(IPAddress, port), authkey=password)
            queueManager.start()
            self.queueManager = queueManager
            pass

    def PutTaskQueue(self,object):
        taskqueue = self.queueManager.GetTaskQueue()
        taskqueue.put(object)

    def GetResultQueue(self):
        resultQueue = self.queueManager.GetResultQueue()
        return resultQueue

    def GetResultQueuePop(self):
        resultQueue = self.queueManager.GetResultQueue()
        if(resultQueue.qsize() > 0):
            return resultQueue.get()
        else:
            return None

    def GetResultQueuePopBlock(self, timeout=None):
        resultQueue = self.queueManager.GetResultQueue()
        return resultQueue.get(timeout=timeout)

    def CloseManager(self):
        try:
            self.queueManager.shutdown()
            print("ProcessingQueueManager exit")
        except:
            pass


if __name__ == '__main__':
    freeze_support()
    server = ProcessingQueueManager()
    server.StartManager('127.0.0.1',5000,b'abc')
    print("OK")
    # for n in range(100,110):
    #     server.PutTaskQueue(n)
    #     print("put %d" % n)
    #
    # for i in range(10):
    #     print(server.GetResultQueuePopBlock())


