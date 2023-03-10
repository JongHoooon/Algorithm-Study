/*
import Foundation
let n = Int(readLine()!)!
let input = readLine()!.components(separatedBy: " ")
var result = [String](repeating: "-1", count: n)
let NGF: [String: Int] = Dictionary(input.map{ ($0, 1) }, uniquingKeysWith: +)
var stack: [Int] = []

for i in 0..<n { 

    while !stack.isEmpty && NGF[input[stack.last!]]! < NGF[input[i]]! {
        let last = stack.removeLast()
        result[last] = input[i]
    } 
    stack.append(i)
}

print(result.joined(separator: " "))
*/


import Foundation

let n = Int(readLine()!)!
let input = readLine()!.components(separatedBy: " ")
var result = [String](repeating: "-1", count: n)
var NGF: [Int] = [Int](repeating: 0, count: n)
var stack: [Int] = []

for i in 0..<n {
    NGF[Int(input[i])!] += 1
}

for i in 0..<n { 

    while !stack.isEmpty && NGF[Int(input[stack.last!])!] < NGF[Int(input[i])!] {
        result[stack.removeLast()] = input[i]
    } 
    stack.append(i)
}

print(result.joined(separator: " "))

