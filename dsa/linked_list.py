class Node:
    def __init__(self,data=None,next=None):
        self.data=data
        self.next=next
class linked_list:
    def __init__(self,start=None):
        self.start=start
    def add_start(self,data):
        n=Node(data)
        if(self.start == None):
            self.start=n
        else:
            n.next=self.start
            self.start=n
    def add_at_last(self,data):
        n=Node(data)
        temp=self.start
        while(temp.next!=None):
            temp=temp.next
        temp.next=n
    def add_after(self,data,num):
        n=Node(num)
        temp=self.start
        while(temp.data!=data):
            temp=temp.next
        n.next=temp.next
        temp.next=n
    def remove(self,data):
        n=Node(data)
        temp=self.start
        while(temp.next.data != data):
            temp=temp.next
        temp.next=temp.next.next
    def print_list(self):
        temp=self.start
        while temp is not None:
            print(temp.data)
            temp=temp.next
    def remove_start(self):
        if self.start!=None:
            self.start=self.start.next
    def remove_last(self):
        temp=self.start
        if temp.next!=None:
            while temp.next.next != None:
                temp=temp.next
            temp.next=None 
        elif temp == None:
            self.start=None
    def search(self,data):
        temp=self.start
        while(temp.next !=None):
            if temp.data == data:
                print(True)
                return 
            temp=temp.next
        print(False)
    def length(self):
        temp=self.start
        count=0
        while temp.next is not None:
            count+=1
            temp=temp.next
        print("length is ",count)
    # def reverse(self):
    #     temp=self.start
    #     while temp.next !=None:
    #         store=temp.next
    #         store.next=temp
    #         temp=store
    #         store=None
    #         temp=temp.next

            
        


my_list=linked_list()
my_list.add_start(4)
my_list.add_start(3)
my_list.add_start(2)
my_list.add_at_last(5)
my_list.add_at_last(10)
my_list.add_after(5,7)
my_list.remove(7)
my_list.remove_start()
my_list.remove_last()
my_list.add_at_last(10)
my_list.length()

my_list.remove_last()
my_list.print_list()
# my_list.reverse()
my_list.print_list()




        
        