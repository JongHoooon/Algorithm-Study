import sys
input = sys.stdin.readline

n = int(input())
cache = [0 for _ in range(n)]

for i in range(n):
    cache[i] = list(map(int, input().split()))
    
for i in range(1, n):
    cache[i][0] = min(cache[i-1][1], cache[i-1][2]) + cache[i][0]
    cache[i][1] = min(cache[i-1][0], cache[i-1][2]) + cache[i][1]
    cache[i][2] = min(cache[i-1][0], cache[i-1][1]) + cache[i][2]

print(min(cache[n-1][0], cache[n-1][1], cache[n-1][2]))