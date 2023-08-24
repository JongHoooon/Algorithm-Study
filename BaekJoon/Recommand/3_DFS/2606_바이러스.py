

"""
dfs - recursion
"""
"""
n = int(input())
v = int(input())

graph = [[] for _ in range(n+1)]
visited = [0 for _ in range(n+1)]

for i in range(v):
    a, b = map(int, input().split())
    graph[a] += [b]
    graph[b] += [a]
    
answer = 0
def dfs(v):
    visited[v] = 1
    global answer
    for nx in graph[v]:
        if visited[nx] == 0:
            answer += 1
            dfs(nx)

            
dfs(1)
print(answer)
"""

"""
dfs - stack
"""
from collections import deque
n = int(input())
v = int(input())
graph = [[] for _ in range(n+1)]
visited = [False for _ in range(n+1)]

for _ in range(v):
    a, b = map(int, input().split(sep=" "))
    graph[a] += [b]
    graph[b] += [a]

def dfs(n: int) -> int:
    count = 0
    visited[n] = True
    stack = deque([n])
    while stack:
        current = stack.pop()
        for nx in graph[current]:
            if not visited[nx]:
                count += 1
                visited[nx] = True
                stack.append(nx) 
    
    return count
    
print(dfs(n=1))
    
"""
bfs
"""
"""
from collections import deque
n=int(input())
v=int(input())
graph = [[] for _ in range(n+1)]
visited = [0 for _ in range(n+1)]

for i in range(v):
    a,b = map(int, input().split())
    graph[a].append(b)
    graph[b].append(a)
 
visited[1]=1
queue = deque([1])
while queue:
    c=queue.popleft()
    for nx in graph[c]:
        if visited[nx] == 0:
            queue.append(nx)
            visited[nx] = 1

print(sum(visited)-1)
"""
