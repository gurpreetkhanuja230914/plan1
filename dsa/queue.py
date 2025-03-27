from queue import Queue
q=Queue(maxsize=5)
q.qsize()
q.put(1)
q.put(2)
q.put("a")
q.get()
q.get()
q.get()
