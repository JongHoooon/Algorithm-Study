import Foundation 

var stack: [Int] = []
var result: [String] = []
var count = 1
for _ in 1...Int(readLine()!)! {
    let num = Int(readLine()!)!

    while count <= num {
        result.append("+")
        stack.append(count)
        count += 1
    }

    if stack.last! == num {
        stack.popLast()
        result.append("-")
    } else {
        print("NO")
        exit(0) 
    }
}

print(result.joined(separator: "\n"))