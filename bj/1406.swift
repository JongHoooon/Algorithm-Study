
/*  시간 초과
import Foundation
var chars = Array(readLine()!)
var index = chars.count 

for _ in 1...Int(readLine()!)! {
    let commands = readLine()!.components(separatedBy: " ")
    if commands[0] == "L" {
        index = index == 0 ? 0 : index - 1
    } else if commands[0] == "D" {
        index = index == chars.count ? index : index + 1
    } else if commands[0] == "B" {
        if index == 0 { continue }
        chars.remove(at: index-1)
        index -= 1
    } else if commands[0] == "P" { 
         chars.insert(Character(commands[1]), at: index)
        index += 1   
    }
}

print(String(chars))
*/


// [left] cursor [right]

import Foundation

var left = Array(readLine()!)
var right: [Character] = []
let n = Int(readLine()!)!

for _ in 0..<n {
    let edit = readLine()!
    switch edit { 
    case "L": 
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D":
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B":
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(edit.last!)
    }
}
print(String(left+right.reversed()))
