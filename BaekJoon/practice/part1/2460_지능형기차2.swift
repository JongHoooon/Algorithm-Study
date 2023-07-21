var count: Int = 0
var answer: Int = 0

for _ in 0..<10 {
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    count -= input[0]
    count += input[1]

    if answer < count { 
        answer = count
    }
}

print(answer)