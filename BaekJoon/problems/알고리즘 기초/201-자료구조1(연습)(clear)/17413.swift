import Foundation

let input = Array(readLine()!).map { String($0) }
var arr: [String] = []
var result: [String] = [] 

for c in input { 
    switch c {
    case "<": // arr를 뒤집에서 result 넣주고 초기화
        result.append(contentsOf: arr.reversed())
        result.append(c)
        isReverse = false
        arr = []
    case ">": // arr result 넣어주고 초기화
        isReverse = true
        result.append(contentsOf: arr)
        result.append(c)
        arr = []
    case " ": 
        if isReverse { // < > 안이 아닐때 - 뒤집어서 넣어주고 초기화
            result.append(contentsOf: arr.reversed())
            result.append(" ")
            arr = []
        } else { // < > 안일때
            arr.append(" ")
        }
    default:
        arr.append(c)
    }
}
result.append(contentsOf: arr.reversed())
print(result.joined())

