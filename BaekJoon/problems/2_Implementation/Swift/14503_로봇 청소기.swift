import Foundation

let nm = readLine()!
    .components(separatedBy: " ")
    .map { Int($0)! }

let rcd = readLine()!
    .components(separatedBy: " ")
    .map { Int($0)! }

// 서 남 동 북
let dr: [Int] = [0, 1, 0, -1]
let dc: [Int] = [-1, 0, 1, 0]

let n = nm[0]
let m = nm[1]
var r = rcd[0]
var c = rcd[1]
var d = 3-rcd[2]
var roomMap: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!
        .components(separatedBy: " ")
        .map { Int($0)! }
    roomMap.append(input)
}


var currentRoom: Int = roomMap[r][c]
var answer: Int = 0

func checkNeedClean() -> Bool {
    for i in dr.indices {
        let nr = r + dr[i]
        let nc = c + dc[i]
        
        guard 0..<n ~= nr && 0..<m ~= nc else { continue }
        
        if roomMap[nr][nc] == 0 {
            return true
        }
    }
    return false
}

while 0..<n ~= r
        && 0..<m ~= c
        && roomMap[r][c] != 1 {
    currentRoom = roomMap[r][c]
    if currentRoom == 0 {
        roomMap[r][c] = -1
        answer += 1
    }
    if checkNeedClean() == false {
        r = r+dr[(d + 2) % dr.count]
        c = c+dc[(d + 2) % dr.count]
    } else {
        var nr = r
        var nc = c
        while roomMap[nr][nc] != 0 {
            d = (d + 1) % dr.count
            nr = r + dr[d]
            nc = c + dc[d]
            if !(0..<n ~= nr) || !(0..<m ~= nc) {
                nr = r
                nc = c
            }
        }
        r += dr[d]
        c += dc[d]
    }
}

print(answer)
