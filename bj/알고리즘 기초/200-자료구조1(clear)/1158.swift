import Foundation

let input: [String] = readLine()!.components(separatedBy: " ")
let c = Int(input[1])! - 1
var arr = Array(1...Int(input[0])!)
var result: [String] = []
var idx = 0


while !arr.isEmpty {
    idx = (idx + c) % arr.count
    result.append(String(arr.remove(at: idx)))
}

print("<" + result.joined(separator: ", ") + ">")