# # to use quotes inside a python file we can use triple quotes 
# strings="'nonu'"
# print(strings)
# s="nonu"
# y="nonu"

# print("string case",s is y)
# print("id ",id(s),id(y))
# s=4
# y=4
# print("integer case",id(s),id(y),s is y)
# s=3.2
# y=3.2

# print("float case",id(s),id(y),s is y)
# s=2+3j
# y=2+3j

# print("complex case",id(s),id(y),s is y)
# s=True
# y=True
# print("boolean case",id(s),id(y),s is y )
# #bytes data type 
# x=[2,3,200,20]
# print(bytes(x))
# x=bytes(x)
# print(x[0])
# command line arguement 

from sys import argv
import custom_module as cm
from custom_package import product as p

# from imp import reload
# reload(cm)
print(cm.add(3,4))
p.product(3,5)
print(cm.x)
print(dir())
print(__name__)
print(cm.__name__)
# If the program executed as an individual program then the value of this variable is
# __main__
# If the program executed as a module from some other program then the value of this
# variable is the name of module where it is defined.
# print("The Number of Command Line Arguments:", len(argv))
# print("The List of Command Line Arguments:", argv)
# print("Command Line Arguments one by one:")
# for x in argv:
#     print(x)

# print(argv[0],argv[1],argv[2],sep=':')
# s='abcdsgshsgysh'
# print(s.count('a',3,7))
