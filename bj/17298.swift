/* 시간 초과
import Foundation

let n = Int(readLine()!)!
let arr: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

var result: [Int] = []

for (i, e) in arr.enumerated() {
    var flag: Bool = false
    for j in (i+1)..<n { 
        if arr[j] > e {
            result.append(arr[j])
            flag = true
            break
        }
    }
    if !flag {
        result.append(-1)
    }
} 

for num in result {
    print(num, terminator: " ")
}
*/


/* 
import Foundation

let n = Int(readLine()!)!
let arr: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

var result: [Int] = Array(repeating: -1, count: n)
var stack: [(Int, Int)] = []

for (i, e) in arr.enumerated() {
    while !stack.isEmpty {
        guard let last = stack.last, last.1 < e  else {
            stack.append((i, e))
            break
        }
        result[last.0] = e
        stack.popLast()
    }
    stack.append((i, e))
}

print((result.map { String($0) }).joined(separator: " "))
*/

/*
import Foundation

let n = Int(readLine()!)!
let arr: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

var result: [Int] = Array(repeating: -1, count: n)
var stack: [(Int, Int)] = []

for (i, e) in arr.enumerated() {
    while !stack.isEmpty {
        guard let last = stack.last, last.1 < e  else {
            stack.append((i, e))
            break
        }
        result[last.0] = e
        stack.popLast()
    }
    stack.append((i, e))
}

print((result.map { String($0) }).joined(separator: " "))
*/


let c = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = [String](repeating: "-1", count: c)
var tc = [Int]()

for i in 0..<c {
    while !tc.isEmpty, input[tc.last!] < input[i] {
        let index = tc.popLast()!
        result[index] = "\(input[i])"
    }
    tc.append(i)
}

print(result.joined(separator: " "))


