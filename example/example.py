def test_cat():

    from pycat import Cat
    from pypet import Pet

    c = Cat()

    assert isinstance(c, (Cat, Pet))
    assert c.talk() == 'Meow!'

def test_dog():

    from pydog import Dog
    from pypet import Pet

    d = Dog()

    assert isinstance(d, (Dog, Pet))
    assert d.talk() == 'Woof!'

def test_pets():

    from pypets import Cat, Dog, Pet

if __name__ == '__main__':

    test_cat()
    test_dog()
    test_pets()

    print('OK')
