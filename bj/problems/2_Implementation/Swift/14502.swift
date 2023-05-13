let size: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let row: Int = size[0]
let col: Int = size[1]
var map: [[Int]] = []
let dx: [Int] = [-1, 1, 0, 0]
let dy: [Int] = [0, 0, -1, 1]

var answer: Int = -1

for _ in 0..<row {
    let row: [Int] = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    map.append(row)
}

bt(0)
print(answer)

func bt(_ wallCount: Int) {
    if wallCount == 3 {
        bfs()
        return
    }

    for i in 0..<row {
        for j in 0..<col {
            if map[i][j] == 0 {
                map[i][j] = 1
                bt(wallCount + 1)
                map[i][j] = 0
            }
        }
    }
}


func bfs() {
    var map: [[Int]] = map
    var queue: [(Int, Int)] = []
    
    for i in 0..<row {
        for j in 0..<col {
            if map[i][j] == 2 {
                queue.append((i, j))
            }
        }
    }

    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        for i in dx.indices {
            let nextX: Int = dx[i] + current.0
            let nextY: Int = dy[i] + current.1

            guard 0..<row ~= nextX && 0..<col ~= nextY else { continue }

            if map[nextX][nextY] == 0 {
                map[nextX][nextY] = 2
                queue.append((nextX, nextY))
            }
        }
    }

    var count: Int = 0
    for i in 0..<row {
        for j in 0..<col {
            if map[i][j] == 0 {
                count += 1
            }
        }
    }
    
    answer = max(count, answer)
}
