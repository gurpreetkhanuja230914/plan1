# def cube(n):
#     for i in range(1,n+1):
#         yield i*i*i
# m=int(input("enter the number till you want cube"))
# s=cube(m)
# for i in range(m):
#     print(next(s))
# n=int(input("enter a number till you want even numbers"))
count=0
def even_number(n):
    for i in range(0,n+1):
            if i%2 ==0:
                 yield "even",i
            else:
                 yield "odd",i

s=even_number(100)
for i in range(100):
         print(next(s))
         