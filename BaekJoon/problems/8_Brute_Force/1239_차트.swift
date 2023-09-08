let n = Int(readLine()!)!

let counts = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

var currentCounts: [Int] = []
var visited = Array(repeating: false, count: n)
var answer = 0
var test = 0

func dfs(_ count: Int) { 
    
    if count == n { 
        test += 1
        answer = max(answer, countLines(currentCounts))
    }

    for (i, c) in counts.enumerated() {
        if visited[i] == false { 
            visited[i] = true
            currentCounts.append(c)
            dfs(count+1)
            currentCounts.removeLast()
            visited[i] = false
        }
    }
}

func countLines(_ counts: [Int]) -> Int { 
    var lines: [Int] = []
    var line = 0
    var count = 0

    for c in counts { 
        line += c
        lines.append(line)
    }
    for i in 0..<lines.count-1 { 
        for j in i+1..<lines.count { 
            if lines[i] + 50 == lines[j] { 
                count += 1
            }
        }
    }
    return count
}

dfs(0)
print(answer)