let ND = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N = ND[0]
let D = ND[1]

var starts: [Int] = []
var ends: [Int] = []
var shortcuts: [Int] = []
var lengths: [Int] = []
for i in 0..<D+1 { 
    lengths.append(i)
}

for _ in 0..<N {
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    
    starts.append(input[0])
    ends.append(input[1])
    shortcuts.append(input[2])
}

for i in 0..<D+1 {
    if i > 0 {
        lengths[i] = min(lengths[i-1]+1, lengths[i])
    }
    for j in 0..<starts.count {
        if i == starts[j] && ends[j] <= D && lengths[starts[j]]+shortcuts[j] < lengths[ends[j]] {
            lengths[ends[j]] = lengths[starts[j]]+shortcuts[j]
        }
    }
}

print(lengths[D])
