# to use quotes inside a python file we can use triple quotes 
strings="'nonu'"
print(strings)
s="nonu"
y="nonu"

print("string case",s is y)
print("id ",id(s),id(y))
s=4
y=4
print("integer case",id(s),id(y),s is y)
s=3.2
y=3.2

print("float case",id(s),id(y),s is y)
s=2+3j
y=2+3j

print("complex case",id(s),id(y),s is y)
s=True
y=True
print("boolean case",id(s),id(y),s is y )
#bytes data type 
x=[2,3,200,20]
print(bytes(x))
x=bytes(x)
print(x[0])

      

