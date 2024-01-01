"""
input()
map()
"""

# n = int(input())
# data = list(map(int, input().split()))

"""
빠르게 입력 받기

- sys.stdin.readline() 메서드 사용
- 입력 후 줄 바꿈 기호가 입력되므로 rstrip() 메서드를 함께 사용해야함
"""

import sys
readline = sys.stdin.readline

data = readline().rstrip()
print(data)

# default는 줄바꿈
print(7, end=" ")

answer = 7
print(f"정답은 {answer} 입니다.")
