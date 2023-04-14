
# DFS&BFS

- 탐색(Search): 많은 양의 데이터 중에서 `원하는 데이터를 찾는 과정`
- DFS, BFS는 그래프 탐색 알고리즘의 대표적인 알고리즘

<br><br>

## DFS(Depth-First Search)

- 깊이 우선 탐색
- 스택 or 재귀함수 사용해서 구현
  1. 탐색 시작 노드를 스택에 삽입하고 방문처리
  2. 스택의 최상단에 노드에 방문하지 않은 인접한 노드가 하나라도 있으면 그 노드를 스택에 넣고 방문처리. 방문하지 않은 인접 노드가 없으면 스택에서 최상단 노드를 꺼낸다.
  3. 2번의 과정을 수행할 수 없을 때까지 반복 


<br>

### 소스 코드

```swift
let graph: [[Int]] = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]

var visited: [Bool] = Array(repeating: false, count: 9)

func dfs(v: Int) { 
    visited[v] = true
    print(v, terminator: " ")

    for n in graph[v] {
        if !visited[n] {
            dfs(v: n)
        }
    }
}

dfs(v: 1)

// 1 8 7 6 3 5 4 2
```

<br><br>

## BFS(Breadth-First Search)

- 너비 우선 탐색, 가까운 노드부터 우선적으로 탐색하는 알고리즘
- 큐 자료구조를 이용
  1. 탐색 시작 노드를 큐에 삽입하고 방문처리
  2. 큐에서 노드를 꺼낸 뒤에 해당 노드의 인접 노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문 처리
  3. 더 이상 2번의 과정을 수행할 수 없을 때까지 반복

<br>

### 소스 코드

```swift
let graph: [[Int]] = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]


var visited: [Bool] = Array(repeating: false, count: 9)

func bfs(v: Int) { 
    var queue: [Int] = [v]
    visited[v] = true

    while !queue.isEmpty {
        let node: Int = queue.removeFirst()
        print(node, terminator: " ")
        for next in graph[node] { 
            if !visited[next] {
                queue.append(next)
                visited[next] = true
            }
        }
    }
}

bfs(v: 1)

// 1 2 7 6 8 3 4 5
```

<br><br>

## 음료수 얼려 먹기

```swift
/*
Swift
*/
let NM: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N: Int = NM[0]
let M: Int = NM[1]
let dx: [Int] = [1, -1, 0, 0]
let dy: [Int] = [0, 0, -1, 1]
var graph: [[Int]] = []
var isVisited: [[Bool]] = Array(
    repeating: Array(repeating: false, count: M),
    count: N
    )

for _ in 0..<N {
    let input: [Int] = Array(readLine()!)
        .map { Int(String($0))! }
        
    graph.append(input)
}

func dfs(x: Int, y: Int) {
    isVisited[x][y] = true

    for i in dx.indices {
        let nx: Int = x + dx[i]
        let ny: Int = y + dy[i]
        guard 0..<N ~= nx && 0..<M ~= ny &&
            graph[nx][ny] == 0 &&
            !isVisited[nx][ny] else { continue }
        dfs(x: nx, y: ny)
    }
}

var count: Int = 0
for i in 0..<N {
    for j in 0..<M {
        if isVisited[i][j] || graph[i][j] == 1 { continue }
        dfs(x: i, y: j)
        count += 1
    }
}

print(count)
```

<br><br>

## 미로 탈출

```python
"""
Python
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
    queue = deque()
    queue.append((x, y))
    
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
```

<br><br>

## 참고

- https://youtu.be/7C9RgOcvkvo
