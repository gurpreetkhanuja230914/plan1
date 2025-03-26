import re 
# pattern=re.compile("gp")
# match=pattern.finditer("gpuegpiehi")
# for i in match :
#     print(i.start(),i.end(),i.group)
# print(match)
# match=re.finditer("\D","1234idbugp")
# for i in match:
#     print(i.start())
# match=re.finditer("d*","1234idbugp")
# for i in match:
#     print(i.start())
# match=re.finditer("d+","1234idbugpd")
# for i in match:
#     print(i.start())
# match=re.finditer("d{2}","1234iddbugp")
# # m=re.match("a","abc")
# # print(m)
# # for i in match:
# #     print(i.start())
# m=re.fullmatch("a","a")
# print(m)
# for i in match:
#     print(i.start())
# rules like start with a -k and second word is of digital by 3 and atleast two digit  allowed character a-z,A-Z,0-9,#
# s=input("enter the string which you want to check")
# m=re.match("[a-k][0369][a-zA-Z0-9#]*",s)
# if m:
#     print("you entered according to rules")
# else:
#     print("you entered wrong")
import re,urllib
import urllib.request
sites="google rediff".split()
print(sites)
for s in sites:
    print("Searching...",s)
    u=urllib.request.urlopen("http://"+s+".com")
    text=u.read()
    title=re.findall("<title>.*</title>",str(text),re.I)
print(title[0])