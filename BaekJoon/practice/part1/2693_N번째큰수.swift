
let T = Int(readLine()!)!

for _ in 0..<T { 
    var input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }

    input.sort()
    print(input[7])
}