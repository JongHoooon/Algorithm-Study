import Foundation

let input = readLine()!.components(separatedBy: " ")
                       .map { Int($0)! }

let N = input[0]
let M = input[1]
let V = input[2]

var graph:[[Int]] = Array(repeating: [], count: N+1)
var DFSVisited: [Bool] = Array(repeating: false, count: N+1)
var BFSVisited = Array(repeating: false, count: N+1)
var DFSArr: [String] = []
var BFSArr: [String] = []

for _ in 0..<M {
    let input = readLine()!.components(separatedBy: " ")
                           .map { Int($0)! }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}


for i in graph.indices {
    graph[i].sort()
}

DFS(V)
BFS(V)
print(DFSArr.joined(separator: " "))
print(BFSArr.joined(separator: " "))

func DFS(_ node: Int) {
    DFSArr.append(String(node))
    DFSVisited[node] = true

    let nexts = graph[node]
    for n in nexts { 
        if DFSVisited[n] { continue }
        DFS(n)
    }
}

func BFS(_ node: Int) { 
    var queue: [Int] = [] 
    BFSVisited[node] = true
    queue.append(node)
    
    while !queue.isEmpty {
        BFSArr.append(String(queue.first!))
        let nexts = graph[queue.removeFirst()]
        for n in nexts { 
            if BFSVisited[n] { continue }
            queue.append(n)
            BFSVisited[n] = true
        }
    }
}
