
typealias Point = (x: Int, y: Int)

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let r = input[0]
let c = input[1]
let k = input[2]
let start = Point(r-1, 0)
let end = Point(0, c-1)

var maps: [[Character]] = []
var visited = Array(
    repeating: Array(repeating: false, count: c),
    count: r
)

for _ in 0..<r { 
    let input: [Character] = Array(readLine()!)
    maps.append(input)
}

var answer = 0

func dfs(_ x: Int, _ y: Int, _ count: Int) { 
    visited[x][y] = true

    if count == k && (x, y) == end {
        answer += 1
    }

    for i in dx.indices { 
        let nx = x + dx[i]
        let ny = y + dy[i]

        guard 0..<r ~= nx &&
              0..<c ~= ny &&
              visited[nx][ny] == false &&
              maps[nx][ny] != "T" 
        else { continue }

        dfs(nx, ny, count + 1)
        visited[nx][ny] = false
    }
}


dfs(start.x, start.y, 1)
print(answer)



/*
현수: 왼쪽 아래 점
집: 오른쪽 위에

지나친곳 다시 갈 수 없다.

T로 표시된 부분은 갈 수 없다.
R * C 맵
거리 K

 */