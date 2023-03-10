import Foundation

let n: Int = Int(readLine()!)!
var input = readLine()!
var stack: [Double] = []
var nums: [Double] = []

for _ in 0..<n {
    let num = Double(readLine()!)!
    nums.append(num)
}

for c in Array(input) {
    if c.isLetter {
        stack.append( nums[Int(c.asciiValue! - 65)] )
    } else { 
        let second = stack.removeLast()
        let first = stack.removeLast()
        switch c {
        case "*":
            stack.append(first * second)
        case "/":
            stack.append(first / second)
        case "+":
            stack.append(first + second)
        case "-":
            stack.append(first - second)
        default:
            break
        }
    }
}
print(String(format: "%.2f", stack[0]))

