import unittest
class TestCaseMath(unittest.TestCase):
    pass
class TestCaseHello(unittest.TestCase):
    pass 
loader=unittest.TestLoader
load_math_test_case=loader.loadTestsFromTestCase(TestCaseMath)
load_hello_test_case=loader.loadTestsFromTestCase(TestCaseHello)
combined_test_suite=unittest.TestSuite([load_hello_test_case,load_math_test_case])
runner=unittest.TextTestRunner
runner.run(combined_test_suite)
