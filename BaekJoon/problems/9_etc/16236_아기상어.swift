let n = Int(readLine()!)!
var table: [[Int]] = []
var sizeOfShark = 2
var countOfSharkEat = 0
var positionOfShark = (0, 0)
var countOfTime = 0
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var isNoMoreEat = false

for _ in 0..<n { 
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    table.append(input)
}

loop1: for i in 0..<n { 
    for j in 0..<n { 
        if table[i][j] == 9 { 
            positionOfShark = (i, j)
            table[i][j] = 0
            break loop1
        }
    }
}

func bfs() {
    var index = 0 
    var candiateFishes: [(Int, Int)] = []
    var isVisited = Array(
        repeating: Array(repeating: -1, count: n),
        count: n
    )
    isVisited[positionOfShark.0][positionOfShark.1] = 0
    var queue = [positionOfShark]

    while index < queue.count { 
        let current = queue[index]
        index += 1
        if candiateFishes.isEmpty == false,
           isVisited[candiateFishes[0].0][candiateFishes[0].1] <= isVisited[current.0][current.1] { 
            continue
        }
        for i in dx.indices { 
            let nx = current.0 + dx[i]
            let ny = current.1 + dy[i]
                                                            
            // 이동
            guard 0..<n ~= nx,
                  0..<n ~= ny,
                  isVisited[nx][ny] == -1,
                  table[nx][ny] <= sizeOfShark
            else {
                continue
            }

            isVisited[nx][ny] = isVisited[current.0][current.1] + 1

            if table[nx][ny] > 0, 
               table[nx][ny] < sizeOfShark { 
                candiateFishes.append((nx, ny))
                continue
            }

            queue.append((nx, ny))
        }
    }

    if candiateFishes.isEmpty == true { 
        isNoMoreEat = true
        return 
    }

    candiateFishes.sort { 
        if $0.0 == $1.0 { 
            return $0.1 < $1.1
        } else { 
            return $0.0 < $1.0
        }
    }

    let fishForEat = candiateFishes[0]
    countOfSharkEat += 1
    if countOfSharkEat == sizeOfShark { 
        sizeOfShark += 1
        countOfSharkEat = 0
    }
    positionOfShark = fishForEat
    table[fishForEat.0][fishForEat.1] = 0
    countOfTime += isVisited[fishForEat.0][fishForEat.1]
    isNoMoreEat = false
    
}

while isNoMoreEat == false { 
    bfs()
}

print(countOfTime)

/*
가장 가까운 물고기 찾는 법 - bfs, dfs
최단거리, 가장 위, 왼쪽에 있는 물고기 우선순위로 -> bfs 인데 상, 좌, 하, 우 로 이동시키면 될거같음

*/

/*
N * N 공간
물고기 M마리, 아기 상어 1마리
한 칸에는 물고기 최대 1마리 존재 가능

처음 아기 상어의 크기 : 2
아기 상어는 1초에 상하좌우로 한칸씩 이동 가능

- 자신의 크기보다 큰 물고기가 있는 칸은 지나갈 수 없음
- 아기 상어는 자신의 크기보다 작은 물고기만 먹을 수 있다.
- 같은 물고기는 먹을 수 없지만, 지나 갈 수 있다.

아기 상어의 이동 결정 방법
- 더 이상 먹을 수 있는 물고기가 공간에 없다면 아기 상어는 엄마 상어에게 도움을 요청
- 먹을 수 있는 물고기가 1마리라면, 그 물고기를 먹으러 간다.
- 먹을 수 있는 물고기가 1마리보다 많다면, 거리가 가장 가까운 물고기를 먹으러 간다.
    - 거리는 아기 상어가 있는 칸에서 물고기가 있는 칸으로 이동할 때, 지나야하는 칸의 개수의 최솟값.
    - 거리가 가까운 물고기가 많다면, 가장 위에 있는 물고기, 그러한 물고기가 여러마리라면, 가장 왼쪽에 있는 물고기 먹음


- 아기 상어의 이동은 1초걸림
- 물고기를 먹는데 걸리는 시간은 없음 
- 아기상어는 자신의 크기와 같은 수의 물고기를 먹으면 레벨업

아기 상어가 몇 초 동안 엄마 상어에게 도움을 요청하지 않고 물고기를 잡아먹을 수 있는지,,
*/