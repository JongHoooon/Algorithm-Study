let NM = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N = NM[0]
let M = NM[1] 

var isVisit = Array(repeating: false, count: N)
var map: [Int: [Int]] = [:]
var answer = 0

for _ in 0..<M { 
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }

    let u = input[0]-1 
    let v  = input[1]-1

    map[u, default: []].append(v)
    map[v, default: []].append(u)
}

func dfs(_ n: Int) { 
    guard isVisit[n] == false else { return }

    answer += 1
    isVisit[n] = true
    var queue = [n]

    while !queue.isEmpty {
        let current = queue.removeLast()       
        let nexts = map[current, default: []]

        for n in nexts { 
            guard isVisit[n] == false else { continue }

            isVisit[n] = true
            queue.append(n)
        }
    }
}

for n in 0...(N-1) { 
    dfs(n)
}

print(answer)