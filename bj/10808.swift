import Foundation

let input: [Character] = Array(readLine()!)
var answer: [Int] = Array(repeating: 0, count: 26)

for c in input {
    answer[Int(c.asciiValue!) - 97] += 1
}

print(answer.map { String($0) }
            .joined(separator: " "))