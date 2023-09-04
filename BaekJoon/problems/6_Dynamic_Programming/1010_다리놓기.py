
"""
n, r = n-1, r + n-1, r-1

i == j -> return 1
j == 0 -> return 1
"""


"""
bottom up
"""
# import sys

# cache = [[0 for _ in range(31)] for _ in range(31)]

# for i in range(31):
#     for j in range(31):
#         if i == j or j == 0:
#             cache[i][j] = 1
#             continue
    
#         cache[i][j] = cache[i-1][j] + cache[i-1][j-1]

# t = int(sys.stdin.readline())

# for _ in range(t):
#     l, r = map(int, sys.stdin.readline().split())
#     print(cache[r][l])

"""
top down
"""

import sys

cache = [[0 for _ in range(31)] for _ in range(31)]

def dp(n, r): 
    if cache[n][r] != 0:
        return cache[n][r]
    
    if n == r or r == 0:
        cache[n][r] = 1 
        return 1
        
    cache[n][r] = dp(n-1, r-1) + dp(n-1, r)
    return cache[n][r]

t = int(sys.stdin.readline())

for _ in range(t):
    l, r = map(int, sys.stdin.readline().split())
    print(dp(r, l))