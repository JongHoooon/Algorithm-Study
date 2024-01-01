
"""
사전 자료형: 키(Key)와 값(Value)의 쌍을 데이터로 가지는 자료형
- 변경 불가능한(Immutable) 자료형을 키로 사용한다.
- 해시 테이블을 이용해 O(1)의 시간에 처리할 수 있다.
"""

data = dict()
data["사과"] = "Apple"
data["바나나"] = "Banana"
data["코코넛"] = "Coconut"

b = { 
    "홍길동": 97,
    "이순신": 98
}

if "사과" in data:
    print("사과 존재함")
    
print(data["사과"])

print(data.keys())
print(data.values())

print(b)

