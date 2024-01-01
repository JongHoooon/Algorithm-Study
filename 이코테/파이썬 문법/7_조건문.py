a = {"a": 1, "b": 2}



def test(a, b):
    test1 = a + b
    test2 = a - b
    return test1, test2

print((lambda a, b: a + b)(3, 7))

list1 = [1, 2, 3, 4, 5]
list2 = [6, 7, 8, 9, 10]

result = list(map(lambda a, b: a + b, list1, list2))

print(result)