
let T = Int(readLine()!)!

let dx = [-1, 1, 0, 0] 
let dy = [0, 0, -1, 1]

func countWorm(_ M: Int, _ N: Int, _ K: Int) { 
    var count = 0

    var table: [[Int]] = Array(
        repeating: Array(repeating: 0, count: M),
        count: N
    )

    for _ in 0..<K { 
        let point = readLine()!
            .split(separator: " ")
            .map { Int($0)! }

        table[point[1]][point[0]] = 1
    }

    for y in 0..<N { 
        for x in 0..<M {
            guard table[y][x] == 1 else { continue }

            count += 1

            var queue: [(Int, Int)] = [(y, x)]
            table[y][x] = 0

            while !queue.isEmpty {
                let current = queue.removeLast()
                for i in dx.indices { 
                    let ny = current.0 + dy[i]
                    let nx = current.1 + dx[i]

                    guard 0..<N ~= ny && 0..<M ~= nx else { continue }
                    guard table[ny][nx] == 1 else { continue }
                    
                    table[ny][nx] = 0
                    queue.append((ny, nx))
                }
            }
        }
    }

    print(count)
}

for _ in 0..<T { 
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    let M = input[0]
    let N = input[1]
    let K = input[2]

    countWorm(M, N, K)
}
