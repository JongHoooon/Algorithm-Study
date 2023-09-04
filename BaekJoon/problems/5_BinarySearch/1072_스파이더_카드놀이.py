import sys

x, y = map(int, sys.stdin.readline().split())
z = int((y * 100 / x))

answer = -1

l = 0
r = 1000000000

while l <= r:
    
    mid = (l + r) // 2
    nx = x + mid
    ny = y + mid
    nz = int((ny * 100 / nx))

    if nz < z+1:
        l = mid+1
    else:
        r = mid-1
        answer = mid
    
print(answer)