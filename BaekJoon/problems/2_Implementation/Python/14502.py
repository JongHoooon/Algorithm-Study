
from collections import deque
from itertools import combinations
import sys
input = sys.stdin.readline

dx = [1, -1, 0, 0]
dy = [0, 0, -1, 1]

N, M = map(int, input().split(" "))
lab = []

for n in range(N):
    lab.append(list(map(int, input().split(" "))))
    
virus = []
zeros = []

for n in range(N):
    for m in range(M):
        if lab[n][m] == 2:
            virus.append([n, m])
        elif lab[n][m]:
            zeros.append([n, m])
            
def bfs(star, N, M, lab_temp):
    que = deque(star)
    visited = [[False for m in range(M)] for n in range(N)]
    
    while que: 
        nx, ny = que.popleft
        if 0 <= nx < N and 0 <= ny < M:
            if (not visited[nx][ny]) and lab_temp[nx][ny] != 1:
                visited[nx][ny] = True
                lab_temp[nx][ny] = 2
                for i in range(4):
                    que.append([nx+dx[i], ny+dy[i]])
                    
ans = list()
for c in combinations(zeros, 3):
    lab_temp = [l.copy() for l in lab]
     
    