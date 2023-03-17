
let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N = input[0]
let M = input[1]

var graph: [[Int]] = Array(repeating: [], count: N+1)
var isVisited: [Bool] = Array(repeating: false, count: N+1)
var count: Int = 0

for _ in 0..<M {
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }

    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

func dfs(node: Int) {
    if !isVisited[node] {
        isVisited[node] = true
        for n in graph[node] {
            dfs(node: n)
        }
    }
}

for i in 1...N {
    if !isVisited[i] { 
        count += 1
        dfs(node: i)
    }
}

print(count)





/*

let input = readLine()!
    .components(separatedBy: " ")
    .map { Int($0)! }

let N = input[0]
let M = input[1]
var graph: [[Int]] = Array(repeating: [], count: N+1)
var isVisited: [Bool] = Array(repeating: false, count: N+1)

for _ in 0..<M {
    let nodes = readLine()!
        .components(separatedBy: " ")
        .map { Int($0)! }

    graph[nodes[0]].append(nodes[1])
    graph[nodes[1]].append(nodes[0])
}

func bfs(node: Int) {
    var queue: [Int] = []
    queue.append(node)
    isVisited[node] = true
    
    while !queue.isEmpty {
        let nexts = graph[queue.removeFirst()]
        for n in nexts { 
            if isVisited[n] { continue }
            isVisited[n] = true
            queue.append(n)
        }
    }
}

var answer: Int = 0
for n in 1...N {
    if isVisited[n] { continue }
    answer += 1
    bfs(node: n)
} 

print(answer)
*/




/**
// using dfs

func dfs(node: Int) { 
    if isVisited.contains(node) { return }
    isVisited.append(node)

    guard let next = (graph[node]?.filter { !isVisited.contains($0) }) else { return }
    for n in next { 
        dfs(node: n)
    }
}

var result: Int = 0
for n in graph.keys {
    if isVisited.contains(n) { continue }
    result += 1
    dfs(node: n)
}

print(result)
*/


/*

1 - 2 , 5 
2 - 1, 5
3 - 4
4 - 3, 6
5 - 1, 2
6 - 4

*/