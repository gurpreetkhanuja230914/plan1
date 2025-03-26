
def greet(f):
    def wrap():
        print("hello inside greet")
        f()
        print("good night")
    return wrap
@greet
def good_morning():
    print("good morning dear")
good_morning()
