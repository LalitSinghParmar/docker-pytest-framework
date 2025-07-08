from app.calculator import add, subtract

def test_add():
    assert add(3, 2) == 5

def test_subtract():
    assert subtract(10, 4) == 6
