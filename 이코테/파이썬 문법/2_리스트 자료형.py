"""
- 여러 개의 데이터를 연속적으로 담아 처리하기 위해 사용하는 자료형이다.
- 배열의 기능 및 연결 리스트와 유사한 기능을 지원
"""

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
n = 10
a = [0] * n
print(a)

"""
- 인덱싱: 리스트의 특정한 원소에 접근
"""
a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
a[7]
a[-1]
a[-3]


"""
- 슬링이싱: 연속적인 위치를 갖는 원소들을 가져와야 할 때
"""
a = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# 두 번째 ~ 네 번째 원소까지
a[1:4]

"""
리스트 컴프리헨션
- 대괄호 안에 조건문, 반복문을 적용해 리스트를 초기화
"""

array = [i for i in range(10)]
print(array)

array = [i for i in range(20) if i % 2 == 1]
print(array)

array = [i * i for i in range(1, 10)]
print(array)

"""
2 차원 리스트 초기화시 효과적으로 사용
"""
n = 10
m = 8
array = [[0] * m for _ in range(n)]

# 다음과 같이 작성하면 오류발생할 수 있음
# 전체 리스트안에 포함된 각 리스트가 모두 같은 객체로 인식
array = [[0] * m] * n

n = 4
m = 3

array = [[0] * m for _ in range(n)]
print(array)

array[1][1] = 5
print(array)

a = [1, 2, 3, 4, 5, 5, 5]
remove_set = {3, 5}

result = [i for i in a if i not in remove_set]
print(result)
