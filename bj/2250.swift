import Foundation 

struct Node { 
    let item: Int
    let left: Int
    let right: Int
}

let N = Int(readLine()!)!
var tree: [Int: Node] = [:]
var parent: [Int] = Array(repeating: 0, count: N+1)

for _ in 0..<N {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    tree[input[0]] = Node(item: input[0], left: input[1], right: input[2])

    if input[1] != -1 {
        parent[input[1]] = input[0]
    }

    if input[2] != -1 {
        parent[input[2]] = input[0]
    }
}

var root: Int = 0 
for i in 1..<parent.count { 
    if parent[i] == 0 {
        root = i
        break
    }
}

var dp: [(Int, Int)] = []
var count: Int = 0
func dfs(_ depth: Int, _ item: Int) {
    if dp.count < depth {
        dp.append((Int.max, -Int.max))
    }

    if tree[item]!.left != -1 {
        dfs(depth+1, tree[item]!.left)
    }

    count += 1
    dp[depth-1].0 = min(dp[depth-1].0, count)
    dp[depth-1].1 = max(dp[depth-1].1, count)

    if tree[item]!.right != -1 {
        dfs(depth+1, tree[item]!.right)
    }
}

dfs(1, root)

var index = 0
var width: Int = -Int.max
for i in 0..<dp.count { 
    let new = dp[i].1 - dp[i].0 + 1
    if new > width { 
        width = new 
        index = i+1
    }
}

print("\(index) \(width)")