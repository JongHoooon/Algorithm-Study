

/*
for i in 0..<array.count {
    var minIndex = i
    for j in i+1..<array.count {
        if array[minIndex] > array[j] {
            minIndex = j
        }
    }
    array.swapAt(i, minIndex)   
}

print(array)
*/

/*
for i in 0..<array.count {
    for j in stride(from: i, to: 0, by: -1) {
        if array[j-1] > array[j] {
            array.swapAt(j-1, j)
        } else {
            break
        }
    }
}

print(array)
*/

/*
var array: [Int] = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

func quickSort(start: Int, end: Int) {
    if start >= end { return } // 원소가 1개인 경우 죵로
    
    let pivot: Int = start // 보통 첫 번째 원소로 피벗
    var left: Int = pivot + 1
    var right: Int = end
    while left <= right {
        // 피벗보다 큰 데이터를 찾을 때까지 반복
        while left <= end && array[pivot] >= array[left] {
            left += 1
        }
        // 피벗보다 작은 데이터를 찾을 때까지 반복
        while right > start && array[pivot] <= array[right] {
            right -= 1
        }
        // 엇갈렸다면 피벗보다 작은 데이터와 피벗 스왑
        if left > right {
            array.swapAt(pivot, right)
        } else {
        // 엇갈리지 않았다면 작은 데이터 와 큰 데이터를 교체
        array.swapAt(left, right)
        }
    }
    quickSort(start: start, end: right-1)
    quickSort(start: right+1, end: end)
}

quickSort(start: 0, end: array.count-1)
print(array)
*/

/*
let array: [Int] = [7, 5, 9, 0, 3, 1, 6, 2, 9, 1, 4, 8, 0, 5, 2]
var counter: [Int] = Array(repeating: 0, count: array.count+1)

for i in 0..<array.count { 
    counter[array[i]] += 1
}

for i in 0..<counter.count {
    for _ in 0..<counter[i] {
        print(i, terminator: " ")
    }
}
*/

/*
func solution(_ n: Int) {
    var count: Int = 0

    for i in 0..<3600 { 
        var str: String = ""
        str.append("\(i/60)")
        str.append("\(i%60)")
        if str.contains("3") { 
            count += 1
        }
    }

    var answer: Int = 0
    for i in 0...n {
        if i == 3 { 
            answer += 3600
        } else { 
            answer += count
        }
    }
    print(answer)
}

solution(5)
*/

// let graph: [[Int]] = [
//     [],
//     [2, 3, 8],
//     [1, 7],
//     [1, 4, 5],
//     [3, 5],
//     [3, 4],
//     [7],
//     [2, 6, 8],
//     [1, 7]
// ]


// var visited: [Bool] = Array(repeating: false, count: 9)

// func bfs(v: Int) { 
//     var queue: [Int] = [v]
//     visited[v] = true

//     while !queue.isEmpty {
//         let node: Int = queue.removeFirst()
//         print(node, terminator: " ")
//         for next in graph[node] { 
//             if !visited[next] {
//                 queue.append(next)
//                 visited[next] = true
//             }
//         }
//     }
// }

// bfs(v: 1)

/*
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