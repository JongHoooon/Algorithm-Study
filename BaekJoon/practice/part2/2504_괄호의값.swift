import Foundation

let input: [Character] = Array(readLine()!)
var stack: [Character] = []

var temp = 1
var answer = 0

for (i, c) in input.enumerated() { 

    switch c { 
    case "(": 
        stack.append(c)
        temp *= 2
    case "[":
        stack.append(c)
        temp *= 3
    case ")":
        guard let last = stack.last, 
              last == "("   
        else { 
            print(0)
            exit(0)
        }
        if input[i-1] == "(" {
            answer += temp
        }
        _ = stack.removeLast()
        temp /= 2
    case "]":
        guard let last = stack.last, 
              last == "["   
        else { 
            print(0)
            exit(0)
        }
        if input[i-1] == "[" {
            answer += temp
        }
        _ = stack.removeLast()
        temp /= 3
    default:
        break
    }
}

if stack.isEmpty { 
    print(answer)
} else {
    print(0)
}
