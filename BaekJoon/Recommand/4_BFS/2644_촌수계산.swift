import Foundation

let n = Int(readLine()!)!

let people = readLine()!
    .split(separator: " ")
    .map { Int($0)!-1 }

let m = Int(readLine()!)!
var chonMap: [[Int]] = Array(repeating: [], count: n)
var isVisited: [Bool] = Array(repeating: false, count: n)

for _ in 0..<m { 
    let xy = readLine()!
        .split(separator: " ")
        .map { Int($0)!-1 }
    let x = xy[0]
    let y = xy[1]
    chonMap[x].append(y)
    chonMap[y].append(x)
}

let from = people[0]
let to = people[1]
var answer = -1

func dfs(_ current: Int, _ depth: Int) { 
    if current == to { 
        answer = depth
        return
    }

    for c in chonMap[current] { 
        guard isVisited[c] == false else { continue }
        
        isVisited[c] = true
        dfs(c, depth+1)
    }
}

dfs(from, 0)

print(answer)