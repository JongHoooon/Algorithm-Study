
let input: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
let N: Int = input[0]
let K: Int = input[1]

var things: [(Int, Int)] = []

for _ in 0..<N { 
    let input: [Int] = readLine()!
        .split(separator: " ")
        .map { Int(String($0))! }
    things.append((input[0], input[1]))
}

print(things)