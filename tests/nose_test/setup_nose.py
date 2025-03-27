import nose 
from nose.tools import with_setup
def setUpModule( module):
    print("%s" %(setUpModule.__name__,))
def tearDownModule( module):
    print("%s" %(tearDownModule.__name__,))
def TearDownfunc():
    print("%s" %(TearDownfunc.__name__,))
def SetUpfunc():
    print("%s" %(SetUpfunc.__name__,))
@with_setup(SetUpfunc,TearDownfunc)
def test_case1():
    print("%s" %(test_case1.__name__,))
class test_class_1:
    def setup(self):
        print("%s called before each test method" % test_class_1.setup.__name__)
    def teardown(self):
        print("%s called after  each test method" % test_class_1.teardown.__name__)
    @classmethod
    def setup_class(cls):
        print("%s this method is called before any method in this class is executed" % test_class_1.setup_class.__name__)
    @classmethod
    def teardown_class(cls):
        print("%s this method is executed after every method of this class is executed" % test_class_1.teardown_class.__name__)
    def test_case_2(self):
        print("%s" % test_class_1.test_case_2.__name__)

