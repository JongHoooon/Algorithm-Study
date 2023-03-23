

"""
// 선택정렬
for i in range(len(array)):
    min_index = i
    for j in range(i+1, len(array)):
        if array[min_index] > array[j]:
            min_index = j
    array[i], array[min_index] = array[min_index], array[i]
    
print(array)
"""

"""
for i in range(1, len(array)):
    for j in range(i, 0, -1):
        if array[j] < array[j-1]:
            array[j], array[j-1] = array[j-1], array[j]
        else:
            break

print(array)
"""

"""
오름차순 정렬
"""
"""
array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

def quick_sort(array, start, end):
    if start >= end: return
    
    pivot = start
    left = start+1
    right = end
    
    while left <= right:
        while left <= end and array[pivot] <= array[left]:
            left += 1
        while right > start and array[pivot] >= array[right]:
            right -= 1
        if left > right:
            array[pivot], array[right] = array[right], array[pivot]
        else:
            array[left], array[right] = array[right], array[left]
    
    quick_sort(array, start, right-1)
    quick_sort(array, right+1, end)

quick_sort(array, 0, len(array)-1)
print(array)
"""

"""
array = [7, 5, 9, 0, 3, 1, 6, 2, 9, 1, 4, 8, 0, 5, 2]
count = [0]*(max(array)+1)

for i in range(len(array)):
    count[array[i]] += 1

for i in range(len(count)):
    for j in range(count[i]):
        print(i, end=" ")
"""

"""
array = [7, 5, 9, 0, 3, 1, 6, 2, 9, 1, 4, 8, 0, 5, 2]
counter = {}

for e in array:
    counter.setdefault(e, 0)
    counter[e] += 1

for key in sorted(counter.keys()):
    for _ in range(counter[key]):
        print(key, end=" ")
"""

"""
import sys
from collections import deque
input = sys.stdin.readline

N, M = map(int, input().split())
graph = []
distances = [[0 for _ in range(M)] for _ in range(N)]
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

for _ in range(N):
    graph.append(list(map(int, input().strip())))

def bfs(x, y):
    distances[x][y] = 1
    queue = deque([(x, y)])
    
    while queue: 
        qx, qy = queue.popleft()
        for i in range(4):
            nx = qx + dx[i]
            ny = qy + dy[i]
            if nx < 0 or nx >= N or ny < 0 or ny >= M: continue
            if graph[nx][ny] == 0: continue
            if distances[nx][ny] != 0: continue
            distances[nx][ny] = distances[qx][qy] + 1
            queue.append((nx, ny))
            if nx == N-1 and ny == M-1: return
        
bfs(0, 0)
print(distances[N-1][M-1])
                    
            

# print(not 1 < 3 < 6 or not 0 < 33 < 9)
"""

"""
d = [0] * 100

d[1] = 1
d[2] = 1
n = 99
for i in range(3, n+1):
    d[i] = d[i-1] + d[i-2]
    
print(d[n])
"""


for tc in range(int(input())):
    n, m = map(int, input().split())
    array = list(map(int, input().split()))

    dp = []
    index = 0
    for i in range(n):
        dp.append(array[index:index+m])
        index += m

    print(dp)
