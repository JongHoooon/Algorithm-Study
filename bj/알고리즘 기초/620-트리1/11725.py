import sys
input = sys.stdin.readline
sys.setrecursionlimit(10**6)

N = int(input())
tree = [[] for _ in range(N+1)] 
parent = [0] * (N+1)

for i in range(N-1):
    a, b = map(int, input().split())
    tree[a].append(b)
    tree[b].append(a)
    
def dfs(v: int):
    for node in tree[v]:
        if parent[node] != 0: continue
        parent[node] = v
        dfs(node)

dfs(1)

for i in range(2, N+1):
    print(parent[i])
    
    