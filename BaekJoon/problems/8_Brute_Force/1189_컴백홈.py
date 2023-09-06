import sys

input = sys.stdin.readline

r, c, k = map(int, input().split())
start = [r-1, 0]
end = [0, c-1]
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

visited = [[False for _ in range(c)] for _ in range(r)]
map = []
for _ in range(r):
    map.append(input().strip())
    
answer = 0
def dfs(x, y, count):
    if count == k and [x, y] == end:
        global answer
        answer += 1
        return
    
    for i in range(len(dx)):
        nx = x + dx[i]
        ny = y + dy[i]
        
        if 0 <= nx < r and \
           0 <= ny < c and \
           visited[nx][ny] == False and \
           map[nx][ny] != "T":
               visited[nx][ny] = True
               dfs(nx, ny, count+1)
               visited[nx][ny] = False

visited[start[0]][start[1]] = True
dfs(start[0], start[1], 1)
print(answer)
 