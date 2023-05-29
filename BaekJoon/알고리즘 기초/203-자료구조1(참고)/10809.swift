import Foundation

let input = Array(readLine()!)
var result: [Int] = Array(repeating: -1, count: 26) 

for (i, c) in input.enumerated() {
    if result[Int(c.asciiValue!-97)] == -1 {
        result[Int(c.asciiValue!-97)] = i
    }
}

print(result.map { String($0) }.joined(separator: " "))

// print(Character("a").asciiValue!)
// print(Character("z").asciiValue!)
