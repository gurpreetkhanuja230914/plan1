# class myclass:
#     def __iter__(self):
#         self.a=1
#         return self
#     def __next__(self):
#         if self.a < 10 :
#             x=self.a
#             self.a+=1
#             return x
#         else:
#             raise StopIteration
# me=myclass()
# print("class ka object",me)
# # me_iter=iter(me)
# # print(me_iter)
# for i in me:
#     print(i)
new=[1,2,3]
a=iter(new)
# for i in a:
#     print(i)
print(next(a))
print(next(a))
