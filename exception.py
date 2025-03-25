try:
    n = int(input("enter a number"))
    res = 100 / n
    
except ZeroDivisionError:
    print("You can't divide by zero!")
    
except ValueError:
    print("Enter a valid number!")
    
else:
    print("Division by hundred is ", res)
    
finally:
    print("Execution complete.")