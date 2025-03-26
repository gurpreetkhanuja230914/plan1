# def new(a):
#     return lambda b:b+a
# s=new(5)
# print(s(4))
# print(s(9))
#sort the list by second element using lambda function 
a=[(2,3),(1,5),(3,8)]
result=sorted(a,key=lambda x:x[0])
print(result)