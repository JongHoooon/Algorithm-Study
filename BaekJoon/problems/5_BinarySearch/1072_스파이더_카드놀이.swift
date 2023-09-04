// import Foundation

// let input = readLine()!
//     .split(separator: " ")
//     .map { Int($0)! }

// var total = input[0]
// var win = input[1]
// var current = countRecord(total, win) 

// func countRecord(_ total: Int, _ win: Int) -> Int { 
//     return Int((Float(win) / Float(total)) * 100)
// }

// var left = 0
// var right = 1000000000
// var answer = -1

// while left <= right { 

//     let mid = (left + right) / 2

//     let total = total + mid
//     let win = win + mid
//     let newRecord = countRecord(total, win)

//     if newRecord < current + 1 { 
//         left = mid + 1
//     } else if newRecord > current + 1 { 
//         right = mid - 1
//     } else { 
//         answer = mid
//         right = mid - 1
//     }
// }

// print(answer)

import Foundation

typealias Point = (x: Int, y: Int)
func solution(_ maps:[String]) -> Int {
    let maps: [[Character]] = maps.map { Array(String) }
    var visited = Array(
        repeating: Array(repeating: -1, count: maps[0].count),
        count: maps.count
    )
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var s = Point(-1, -1)
    var e = (x: -1, y: -1)
    var l = (x: -1, y: -1)
    
    for i in 0..<maps.count { 
        for j in 0..<maps[0].count { 
            if maps[i][j] == "S" { 
                s = (i, j) 
                continue
            }
            if maps[i][j] == "E" { 
                e = (i, j) 
                continue
            }
            if maps[i][j] == "L" { 
                l = (i, j) 
                continue
            }
        }
    }
    
    // bfs(_ start: (Int, Int), _ end: (Int, Int)) -> Int { 
        
    // }
    
    return 0
}

