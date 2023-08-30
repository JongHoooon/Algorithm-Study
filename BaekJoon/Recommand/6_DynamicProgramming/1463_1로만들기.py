# from sys import stdin
# import sys

# n = int(stdin.readline())

# dp = {1:0}

# def rec(n: int) -> int:
#     if n in dp.keys():
#         return dp[n]
    
#     temp_cache = [rec(n-1) + 1]
#     if n % 3 == 0:
#         temp_cache.append(rec(n//3)+1)
#     if n % 2 == 0:
#         temp_cache.append(rec(n//2)+1)
    
#     dp[n] = min(temp_cache)
#     # print(dp)
#     return dp[n]

# # print(dp)
# print(rec(n))

"""
Top Down
"""
"""
x=int(input())
dp={1:0}
def rec(n):
    if n in dp.keys():
        return dp[n]
    if (n%3==0) and (n%2==0):
        dp[n]=min(rec(n//3)+1, rec(n//2)+1)
    elif n%3==0:
        dp[n]=min(rec(n//3)+1, rec(n-1)+1)
    elif n%2==0:
        dp[n]=min(rec(n//2)+1, rec(n-1)+1)
    else:
        dp[n]=rec(n-1)+1
    return dp[n]
print(rec(x))
"""

"""
Bottom Up
"""
"""
n = int(input())
cache = [0]*(n+1)
for i in range(2, n+1):
    temp_cache = [cache[i-1]+1]
    if i % 2 == 0:
        temp_cache.append(cache[i//2]+1)
    if i % 3 == 0:
        temp_cache.append(cache[i//3]+1)
    
    cache[i] = min(temp_cache)
    
print(cache[n])
"""

"""
BFS
"""
from collections import deque

x=int(input())
queue=deque([x])
visited=[0]*(x+1)
while queue:
    c = queue.popleft()
    if c == 1: 
        break
    if c % 3 == 0 and visited[c//3] == 0:
        queue.append(c//3)
        visited[c//3]=visited[c]+1
    if c % 2 == 0 and visited[c//2] == 0:
        queue.append(c//2)
        visited[c//2]=visited[c]+1
    if visited[c-1] == 0:
        queue.append(c-1)
        visited[c-1] = visited[c]+1
print(visited[1])
        