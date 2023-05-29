import Foundation

let input = Array(readLine()!)
var previous: Character 
var stack: [Character] = []
var result: [Character] = [] 

for c in input { 
    if c.isLetter {
        result.append(c)
    } else {

        switch c {
        case "(":
            stack.append(c)    
        case ")":
            while stack.last != "(" {
                result.append(stack.removeLast())
            }
            stack.removeLast()
        default:
            if stack.isEmpty || getPriority(stack.last!) < getPriority(c) {
                stack.append(c)
            } else {
                while !stack.isEmpty {
                    if getPriority(stack.last!) >= getPriority(c) {
                        result.append(stack.removeLast())
                    } else {
                        break
                    }
                }
                stack.append(c)
            }
        }
    }
}

while !stack.isEmpty {
    result.append(stack.removeLast())
}

print(String(result))


func getPriority(_ c: Character) -> Int {
    switch c { 
    case "+":
        return 1
    case "-":
        return 1
    case "*":
        return 2
    case "/":
        return 2
    case "(":
        return 0
    default: 
        return -1
    }
}