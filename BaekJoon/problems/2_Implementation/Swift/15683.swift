import Foundation

let input = readLine()! 
    .components(separatedBy: " ")
    .map { Int($0)! }

let n = input[0]
let m = input[1]

var roomTable: [[Int]] = []

for _ in 0..<n { 
    let input = readLine()!
        .components(separatedBy: " ")
        .map { Int($0)! }
    roomTable.append(input)
}

typealias CCTVInfo = (type: Int, x: Int, y: Int)
var cctvInfos: [CCTVInfo] = []
var countOfZero: Int = 0
var answer: Int = Int.max

// 상 좌 하 우
let dx: [Int] = [-1, 0, 1, 0]
let dy: [Int] = [0, -1, 0, 1] 

for x in 0..<n { 
    for y in 0..<m {
        let room = roomTable[x][y]
        if 1...5 ~= room {
            cctvInfos.append((room, x, y))
        } else if room == 0 { 
            countOfZero += 1
        }
    }
}

func checkSpot(_ x: Int, _ y: Int, _ direction: Int, _ roomTable: inout [[Int]]) -> Int {
    var nx = x + dx[direction]
    var ny = y + dy[direction]
    var countOfCheck: Int = 0

    while 0..<n ~= nx && 0..<m ~= ny && roomTable[nx][ny] != 6 { 
        if roomTable[nx][ny] == 0 { 
            countOfCheck += 1
            roomTable[nx][ny] = -1
        }
        nx += dx[direction]
        ny += dy[direction]
    }

    return countOfCheck
}

func runCCTV(_ cctvInfo: CCTVInfo, _ direction: Int, _ roomTable: inout [[Int]]) -> Int {
    var countOfCheck: Int = 0

    switch cctvInfo.type { 
        case 1:
            countOfCheck += checkSpot(cctvInfo.x, cctvInfo.y, direction, &roomTable)
        case 2:
            [0, 2].forEach { 
                countOfCheck += checkSpot(cctvInfo.x, cctvInfo.y, (direction+$0)%4, &roomTable)
            }
        case 3:
            (0...1).forEach { 
                countOfCheck += checkSpot(cctvInfo.x, cctvInfo.y, (direction+$0)%4, &roomTable)
            }
        case 4: 
            (0...2).forEach { 
                countOfCheck += checkSpot(cctvInfo.x, cctvInfo.y, (direction+$0)%4, &roomTable)
            }
        case 5:
            (0...3).forEach { 
                countOfCheck += checkSpot(cctvInfo.x, cctvInfo.y, (direction+$0)%4, &roomTable)
            }
        default:
            break
    }

    return countOfCheck
}

func bt(_ indexOfcctvInfo: Int, _ countOfCheck: Int, _ roomTable: [[Int]]) {
    if indexOfcctvInfo == cctvInfos.count { 
        let countOfBlindSpot = countOfZero - countOfCheck 
        answer = min(countOfBlindSpot, answer)
        return
    }

    var nowTable = roomTable

    for i in dx.indices { 

        let newCountOfCheck = runCCTV(cctvInfos[indexOfcctvInfo], i, &nowTable)
        bt(indexOfcctvInfo+1, countOfCheck+newCountOfCheck, nowTable)
        nowTable = roomTable
    }
}

bt(0, 0, roomTable)

print(answer)


/*--------------------------------------------------------------------------------------------------*/

/*
import Foundation

let input = readLine()!
    .components(separatedBy: " ")
    .map { Int($0)! }

let n = input[0]
let m = input[1]

var roomTable: [[Int]] = []
var cctvInfos: [(type: Int, x: Int, y: Int)] = []
var zeroCount: Int = 0

// 상, 우, 하, 좌
let dx: [Int] = [-1, 0, 1, 0]
let dy: [Int] = [0, 1, 0, -1]

var answer: Int = Int.max

for _ in 0..<n { 
    let input = readLine()!
        .components(separatedBy: " ")
        .map { Int($0)! }

    roomTable.append(input)
}
for x in 0..<n { 
    for y in 0..<m { 
        if 1...5 ~= roomTable[x][y] { 
            cctvInfos.append((roomTable[x][y], x, y))
        } else if roomTable[x][y] == 0 { 
            zeroCount += 1
        }
    }
}

func coverZeroOneLine(_ tempRoomTable: inout [[Int]], _ x: Int, _ y: Int, _ dir: Int) -> Int {
    var nx = x + dx[dir]
    var ny = y + dy[dir]
    var coverCount = 0

    while 0..<n ~= nx && 0..<m ~= ny && tempRoomTable[nx][ny] != 6 {
        if tempRoomTable[nx][ny] == 0 { 
            tempRoomTable[nx][ny] = -1
            coverCount += 1
        }
        nx += dx[dir]
        ny += dy[dir]
    }

    return coverCount
}

func runCCTV(_ cctvType: Int, _ x: Int, _ y: Int, _ dir: Int, _ tempRoomTable: inout [[Int]]) -> Int {
    var coverCount = 0

    switch cctvType {
    case 1: 
        coverCount += coverZeroOneLine(&tempRoomTable, x, y, dir)
    case 2: 
        [0, 2].forEach { 
            coverCount += coverZeroOneLine(&tempRoomTable, x, y, (dir + $0) % 4)
        }        
    case 3:
        (0...1).forEach { 
            coverCount += coverZeroOneLine(&tempRoomTable, x, y, (dir + $0) % 4)
        }
    case 4:
        (0...2).forEach { 
            coverCount += coverZeroOneLine(&tempRoomTable, x, y, (dir + $0) % 4)
        }
    case 5:
        (0...3).forEach { 
            coverCount += coverZeroOneLine(&tempRoomTable, x, y, (dir + $0) % 4)
        }
    default:
        break
    }
    return coverCount
}

func dfs(_ index: Int, _ coverCount: Int, _ tempRoomTable: [[Int]]) { 
    if index >= cctvInfos.count { 
        let blindSpotCount = zeroCount - coverCount
        answer = min(answer, blindSpotCount)
        return
    }

    var nowTable = tempRoomTable
    let nowCCTV = cctvInfos[index]

    for dir in dx.indices { 
        let nowCoverCount = runCCTV(nowCCTV.type, nowCCTV.x, nowCCTV.y, dir, &nowTable)
        dfs(index + 1, coverCount + nowCoverCount, nowTable)
        nowTable = tempRoomTable
    }
}

dfs(0, 0, roomTable)
print(answer)
*/

/*
- 참고: https://0urtrees.tistory.com/227
*/