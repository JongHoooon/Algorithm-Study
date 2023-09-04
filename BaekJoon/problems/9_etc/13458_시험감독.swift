import Foundation

let n = Int(readLine()!)!
let numsOfApplicant: [Int] = readLine()!
    .components(separatedBy: " ")
    .map { Int($0)! }
let input: [Int] = readLine()!
    .components(separatedBy: " ")
    .map { Int($0)! }
let b = input[0]
let c = input[1]

var answer: Int = 0
for num in numsOfApplicant { 
    let num = num - b
    answer += 1

    //🚨예외처리🚨
    guard num > 0 else { continue } 

    answer += Int(ceil(Double(num) / Double(c)))
}

print(answer)
