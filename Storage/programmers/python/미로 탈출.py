from collections import deque

def solution(maps):
    answer = 0
    direction = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    n, m = len(maps), len(maps[0])
    
    for i in range(n): 
        for j in range(m):
            if maps[i][j] == 'S':
              sx, sy = i, j
              
    def bfs(x, y, end):
        q = deque()
        q.append([x, y])
        visited = [[-1]*m for _ in range(n)]
        visited[x][y] = 0
        while q:
            x, y = q.popleft()
            if maps[x][y] == end:
                return [visited[x][y], x, y]
            
            for dir in direction:
                nx = x + dir[0]
                ny = y + dir[1]
                if 0 <= nx < n and 0 <= ny < m:
                    if visited[nx][ny] == -1:
                        if maps[nx][ny] != 'X':
                            q.append([nx, ny])
                            visited[nx][ny] = visited[x][y] + 1
        return None
    
    cnt = bfs(sx, sy, 'L')
    if cnt == None: return -1
    answer += cnt[0]
    
    cnt = bfs(cnt[1], cnt[2], 'E') 
    if cnt == None: return -1
    answer += cnt[0]
    
    return answer

print(solution(["SOOOL","XXXXO","OOOOO","OXXXX","OOOOE"]))
print(solution(["LOOXS","OOOOX","OOOOO","OOOOO","EOOOO"]))
    
    
    
