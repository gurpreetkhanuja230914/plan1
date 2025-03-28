import pytest 
@pytest.mark.parametrize("num,result",[(2,4),(3,6),(4,8)])
def test_multiplication_2(num,result):
    assert num*2==result