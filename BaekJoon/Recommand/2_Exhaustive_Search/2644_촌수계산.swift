import Foundation

let n = Int(readLine()!)!
let nums = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
let start = nums[0]
let end = nums[1]
let m = Int(readLine()!)!
var chonDict: [Int: [Int]] = [:]
var isVisited: [Bool] = Array(repeating: false, count: n+1)

for _ in 0..<m { 
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }

    let x = input[0]
    let y = input[1]
    chonDict[x, default: []].append(y)
    chonDict[y, default: []].append(x)
}

isVisited[start] = true
func dfs(_ c: Int, _ count: Int) { 
    guard let chon = chonDict[c] else { return }

    if chon.contains(end) { 
        print(count)
        exit(0)
    }

    for c in chon { 
        guard !isVisited[c] else { continue }
        isVisited[c] = true
        dfs(c, count+1)
    }
}

dfs(start, 1)

print(-1)