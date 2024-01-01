
"""
집합: 중복을 허용하지 않음, 순서가 없다.
리스트 혹은 문자열을 이용해서 초기화할 수 있다.
- set() 함수를 사용
- 중괄호 {} 사용
- 데이터 조회 및 수정에 있어 O(1)의 시간에 처리할 수 있다.
"""

data = set([1, 1, 2, 3, 4, 4, 5])
print(data)

data = {1, 1, 2, 3, 4, 4, 5}
print(data)

a = {1, 2, 3, 4, 5}
b = {3, 4, 5, 6, 7}

# 합집합
print(a | b)

# 교집합
print(a & b)

# 차집합
print(a - b)

data = {1, 2, 3}

data.add(4)
data.update([5, 6])
print(data)
data.update({9, 8})
print(data)

data.remove(3)
print(data)


"""
사전 자료형과 집합 자료형의 특징
- 리스트나 튜플은 순서가 있어 인덱싱을 통해 자료형의 값을 얻을 수 있다.
- 순서가 없어 인덱싱으로 값을 얻을 수 없다, key혹은 element를 이용해 O(1)의 시간복잡도로 조회한다.
"""