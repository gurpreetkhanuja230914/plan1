import pytest# to use marker you need to import pytest 
@pytest.mark.great
def test_greater():
    num=10
    assert num> 9
@pytest.mark.great
def test_greater_equal():
    num=100
    assert  num >= 100
@pytest.mark.less
def test_lesser():
    num=10
    assert num< 12
@pytest.mark.less
def test_lessser_equal():
    num=10 
    assert num <= 10 
def other():
    s="nonu"
    assert s.upper() == "NONU"



