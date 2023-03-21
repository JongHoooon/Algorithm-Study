import sys
input = sys.stdin.readline

n, m = map(int, input().split())
visited = [False] * n 
result = []  

def backtracking(depth):
    if depth == m:  
        print(' '.join(map(str, result)))
        return
    
    for i in range(n):
        if not visited[i]:  
            visited[i] = True 
            result.append(i+1)  
            backtracking(depth+1)  
            visited[i] = False 
            result.pop()  

backtracking(0)  