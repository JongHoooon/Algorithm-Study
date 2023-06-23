import Foundation

var wheels: [[Int]] = []

for _ in 0..<4 {
    wheels.append(Array(readLine()!).map { Int(String($0))! })
}

let k = Int(readLine()!)!
var indicesOfWheel: [Int] = [0, 0, 0, 0]
var needRotate: [Bool] = Array(repeating: false, count: 4)

func getIndexR(_ index: Int) -> Int {
    return (index + 2) % 8
}

func getIndexL(_ index: Int) -> Int {
    return (index + 6) % 8
}

func rotateWheel(_ n: Int, _ d: Int) {
    var index = indicesOfWheel[n] + d * -1
    if index >= 8 { index = 0 }
    if index < 0 { index = 7 }
    indicesOfWheel[n] = index
}

func checkNeedRotate(_ n: Int) {
    needRotate[n] = true
    switch n {
    case 0:
        if needRotate[1] == false
            && wheels[0][getIndexR(indicesOfWheel[0])] != wheels[1][getIndexL(indicesOfWheel[1])] {
            checkNeedRotate(1)
        }
    case 1:
        if needRotate[0] == false
            && wheels[0][getIndexR(indicesOfWheel[0])] != wheels[1][getIndexL(indicesOfWheel[1])] {
            checkNeedRotate(0)
        }
        if needRotate[2] == false
            && wheels[1][getIndexR(indicesOfWheel[1])] != wheels[2][getIndexL(indicesOfWheel[2])] {
            checkNeedRotate(2)
        }
    case 2:
        if needRotate[1] == false
            && wheels[1][getIndexR(indicesOfWheel[1])] != wheels[2][getIndexL(indicesOfWheel[2])] {
            checkNeedRotate(1)
        }
        if needRotate[3] == false
            && wheels[2][getIndexR(indicesOfWheel[2])] != wheels[3][getIndexL(indicesOfWheel[3])] {
            checkNeedRotate(3)
        }
    case 3:
        if needRotate[3] == false
            && wheels[2][getIndexR(indicesOfWheel[0])] != wheels[3][getIndexL(indicesOfWheel[1])] {
            checkNeedRotate(2)
        }
    default:
        break
    }

}

for _ in 0..<k {
    let input = readLine()!
        .components(separatedBy: " ")
        .map { Int($0)! }
        
    let n = input[0] - 1
    let d = n % 2 == 0 ? input[1] : input[1] * -1   // 0번째 기준으로 변경
    
    checkNeedRotate(n)
    for i in 0..<4 {
        guard needRotate[i] == true else { continue }
        let d = d * Int(pow(Double(-1), Double(i)))
        rotateWheel(i, d)
    }
    needRotate = Array(repeating: false, count: 4)
}

var answer: Int = 0

for i in 0..<4 {
    answer += wheels[i][indicesOfWheel[i]]*Int(pow(Double(2), Double(i))) 
}

print(answer)
