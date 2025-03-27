class Node:
    def __init__(self,data=None,next=None):
        self.data=data
        self.next=next

class Stack:
    def __init__(self,start=None):
        self.start=start
    def push(self,data):
        temp=self.start
        if not self.is_empty():
            while temp.next is not None:
                temp=temp.next
            n=Node(data)
            temp.next=n
        else:
            n=Node(data)
            self.start=n
        # if temp is not None:
        #     while temp.next is not None:
        #         temp=temp.next
        #     n=Node(data)
        #     temp.next=n
        # else:
        #     n=Node(data)
        #     self.start=n
    def is_empty(self):
        if self.start==None:
            return True
        else:
            return False
        
    def pop(self):
        temp=self.start
        if self.is_empty() :
            print("stack is empty")
        else:
            if temp.next is not None:
                while temp.next.next is not None:
                    temp=temp.next
                print("popped element is ",temp.next.data)
                temp.next=None
            elif temp.next==None:
                print("popped element is ",temp.data)
                self.start=None
        
    def print(self):
        if self.start!=None:
            temp=self.start
            while temp is not None:
                print(temp.data)
                temp=temp.next
            


s=Stack()
s.push(3)
s.push(4)
s.push(5)


s.pop()
s.pop()
s.pop()
s.pop()
s.print()
