import Foundation

struct Node {
    let item: Int
    let left: Int
    let right: Int
}

let N = Int(readLine()!)!
var tree: [Int: Node] = [:]
var parents: [Int] = Array(repeating: 0, count: N+1)

for _ in 0..<N {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    tree[input[0]] = Node(item: input[0], left: input: [1], right: input[2])

    if input[1] != -1 {
        parents[input[1]] = input[0]
    }
    if input[2] != -1 {
        parents[input[2]] = input[0]
    }
}

var root = 0
for i in 1..<parents.count {
    if parents[i] == 0 { 
        root = i
        break
    }
}

var dp: [(Int, Int)] = []
var count: Int = 0
func run(depth: Int = 1, item: Int) {
    if dp.count < 
}

print(tree)
