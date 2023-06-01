import Foundation

let input = readLine()!
    .components(separatedBy: " ")
    .map { Int($0)! - 1 }

var i: Int = 0
var answer = 0

while true {
    let n = 15*i + input[0]
    if n % 28 == input[1] && n % 19 == input[2] {  
        answer = n
        break
    }
    i += 1
}

print(answer+1)

// print(5265 % 15)
// print(5265 % 28)
// print(5265 % 19)


/*
n % 15 = 1
n % 28 = 2
n % 19 = 3

17 33 ... 
*/