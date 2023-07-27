import Foundation

let input: [Character] = Array(readLine()!) + ["."]

var count: Int = 0
var answer: String = ""

for c in input { 
    if c == "X" { 
        count += 1
    } else { 
        guard count % 2 == 0 else { 
            print(-1)
            exit(0)
        } 

        let countFour = count / 4
        let countTwo = (count % 4) / 2

        for _ in 0..<countFour { 
            answer += "AAAA"
        }

        for _ in 0..<countTwo { 
            answer += "BB"
        }

        answer += "."
        count = 0
    }
}

_ = answer.popLast()
print(answer)
