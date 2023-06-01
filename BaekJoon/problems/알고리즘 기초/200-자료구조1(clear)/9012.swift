import Foundation 

for _ in 1...Int(readLine()!)! {
    let chars = Array(readLine()!)
    print(solution(chars))
}

func solution(_ chars: [Character]) -> String {
    var stack: [Character] = []

    for c in chars { 
        if c == "(" {
            stack.append(c)
        } else {
            if stack.isEmpty {
                return("NO")
            }
            stack.popLast()
        }
    }
    return stack.isEmpty ? "YES" : "NO"
}