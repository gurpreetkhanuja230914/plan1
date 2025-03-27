import unittest
from customer import Customer as cs
class TestCustomer(unittest.TestCase):
    def setUp(self):
        self.customer_1=cs("gurpreet","kaur",2000)
        self.customer_2=cs("nonu","khanuja",1000)
    def test_customer_mail(self):
        self.assertEqual(self.customer_1.customer_mail,"gurpreet.kaur@gmail.com")
        self.assertEqual(self.customer_2.customer_mail,"nonu.khanuja@gmail.com")
    def test_customer_fullname(self):
        self.assertEqual(self.customer_1.customer_fullname,"gurpreet kaur")
        self.assertEqual(self.customer_2.customer_fullname,"nonu khanuja")
    def test_apply_discount(self):
        self.customer_1.apply_discount()
        self.customer_2.apply_discount()

        self.assertEqual(self.customer_1.purchase,1900)
        self.assertEqual(self.customer_2.purchase,900)
if __name__=='__main__':
    unittest.main()

