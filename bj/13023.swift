import Foundation

let input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let m = Int(input[1])!  
var graph: [[Int]] = Array(repeating: [], count: n)
var visited = Array(repeating: false, count: n)
var isAvailable = false

for _ in 0..<m { 
    let relation = (readLine()!.split(separator: " ")).map { Int($0)! }
    graph[relation[0]].append(relation[1])
    graph[relation[1]].append(relation[0])
}

func dfs(_ n: Int, _ depth: Int) {
    if depth == 4 {
        isAvailable = true
        return
    }

    visited[n] = true
    for i in 0..<graph[n].count { 
        let next = graph[n][i]
        if !visited[next] {
            dfs(next, depth + 1)
        }
    }
    visited[n] = false
}

for i in 0..<n {
    dfs(i, 0)
    if isAvailable { break }
}

isAvailable ? print(1) : print(0)
