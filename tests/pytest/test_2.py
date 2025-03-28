import pytest# to use marker you need to import pytest 
@pytest.mark.great
def test_greater():
    num=21
    assert num> 20
@pytest.mark.great
def test_greater_equal():
    num=50
    assert  num >= 50
@pytest.mark.less
def test_lesser():
    num=12
    assert num< 12
@pytest.mark.less
def test_lessser_equal():
    num=100 
    assert num <= 10 
def other():
    s="nonu"
    assert s.upper() == "NONU"



