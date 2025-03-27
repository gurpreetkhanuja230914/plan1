# def test_addition():
#     assert  1+2==3
# def test_multiplication():
#     assert 1*2==2
import nose.tools as nt
def setup_module():
    # setup module is there
    pass
def teardown_module():
    # teardown module 
    pass
@nt.with_setup(setup_module,teardown_module)
def test_suite_level():
    pass