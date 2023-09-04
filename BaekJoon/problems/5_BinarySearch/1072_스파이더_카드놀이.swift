import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

var total = input[0]
var win = input[1]
var current = countRecord(total, win) 

func countRecord(_ total: Int, _ win: Int) -> Int { 
    return Int((Float(win) / Float(total)) * 100)
}

var left = 0
var right = 1000000000
var answer = -1

while left <= right { 

    let mid = (left + right) / 2

    let total = total + mid
    let win = win + mid
    let newRecord = countRecord(total, win)

    if newRecord < current + 1 { 
        left = mid + 1
    } else if newRecord > current + 1 { 
        right = mid - 1
    } else { 
        answer = mid
        right = mid - 1
    }
}

print(answer)

