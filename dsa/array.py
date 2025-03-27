import array as arr
types=input("enter the type of array which you want to specify \ni stands for integer \nu for char \nh for short \nl for long \nf for float \nd for double ")
numbers=arr.array(types)
print(type(numbers))

#here i stands for integer b for char h for short l for long f for float d for double 
count=int(input("enter how many numbers you want to add in the array"))
for i in range(count):
    num=input("enter the element which you want to add")
    if types=='i':
        num=int(num)
    elif types=='u':
        num=str(num)
    elif types=='f':
        num=float(num)
    else:
        print("enetered wrong choice")
        break
    
    print(type(num))
    numbers.append(num)
print(numbers)
while(True):
    choice=int(input("enter 1 to add more elements /n 2 for deleting element /n 3 for searching an element"))
    element=input("enter the element with which you want to perform the operations")
    if types=='i':
            element=int(element)
    elif types=='b':
            element=str(element)
    elif types=='f':
            element=float(element)
    if choice ==1 :
        numbers.append(element)
    elif choice==2:
        numbers.remove(element)
    elif choice ==3:
        for i in range(0,count):
            if numbers[i]==element:
                print("element found at",i)
            else:
                print("element not found")
    else:
        print("you entered a wrong choice")
        break
    print(numbers)