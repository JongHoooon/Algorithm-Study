import sys
from collections import deque

sys.setrecursionlimit(10000)
input = sys.stdin.readline

N, M = map(int, input().split())
graph = [[] for _ in range(N+1)]
isVisited = [False for _ in range(N+1)]

for _ in range(M):
    n1, n2 = map(int, input().split())
    graph[n1].append(n2)
    graph[n2].append(n1)
    
def bfs(node):
    queue = deque([node])
    isVisited[node] = True
    
    while queue:
        q = queue.popleft()
        
        for n in graph[q]:
            if isVisited[n] == False:
                queue.append(n)
                isVisited[n] = True
                
count = 0
for i in range(1, N+1):
    if not(isVisited[i]):
        count += 1
        bfs(i)    
    
print(count)
