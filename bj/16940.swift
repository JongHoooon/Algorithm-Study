import Foundation

let n = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n+1)
var isAvailable: Bool = true
var visited = Array(repeating: false, count: n+1)
var parent = Array(repeating: -1, count: n+1)
for _ in 0..<n-1 {
    let relation = readLine()!.split(separator: " ").map { Int($0)! }
    graph[relation[0]].append(relation[1])
    graph[relation[1]].append(relation[0])
}
var inputQueue = readLine()!.split(separator: " ").map { Int($0)! }
var result: [Int] = []

bfs(inputQueue.removeFirst())

print(result == inputQueue ? "1" : "0")


func bfs(_ n: Int) {
    var queue = [Int]()
    queue.append(n)

    while !queue.isEmpty {
        let node = queue.removeFirst()
        if visited[node] { continue }
        visited[node] = true

        for n in graph[node] {
            if !visited[n] { 
                parent[n] = node
            }
        } 
        for _ in graph[node] {
            if inputQueue.isEmpty { 
                isAvailable = false
                return
            }
            let next = inputQueue.removeFirst()
            if parent[next] != node {
                isAvailable = false
                return
            }
            queue.append(next)     
        }
    }
}


/* 
1: [2 3]        queue: 1
2: [1 4]        input:  
3: [1]
4: [2]

1: 1        
2:           
3: 
4: 
*/