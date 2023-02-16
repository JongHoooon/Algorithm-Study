import Foundation 

struct Stack {
    var arr: [Int] = []

    mutating func push(_ element: Int) {
        arr.append(element)
    }

    mutating func pop() -> Int {
        if arr.isEmpty { 
            return -1
        }
        return arr.removeLast()
    }

    var size: Int {
        return arr.count
    }

    var empty: Int {
        return arr.isEmpty ? 1 : 0
    }

    var top: Int {
        if arr.isEmpty {
            return -1
        } 
        return arr.last!
    }
}

var stack = Stack()

for _ in 1...Int(readLine()!)! {
    let commands = readLine()!.components(separatedBy: " ")
     if commands[0] == "push" {
        stack.push(Int(commands[1])!)
     } else if commands[0] == "pop" {
        print(stack.pop())
     } else if commands[0] == "empty" {
        print(stack.empty)
     } else if commands[0] == "top" {
        print(stack.top)
     } else if commands[0] == "size" {
        print(stack.size)
     }
}