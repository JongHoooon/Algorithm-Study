
let input: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N = input[0]
let M = input[1]

var map: [[Int]] = []

for _ in 0..<N {
    let input: [Int] = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    
    map.append(input)
}

print(map)

/*
0: 빈칸, 1: 집, 2: 치킨집


*/