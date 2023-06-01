import Foundation

let n = Int(readLine()!)!
var candies:[[String]] = []
var result: Int = 0 

for _ in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    candies.append(input)
}

for i in 0..<n {
    for j in 0..<n {
        if j < n-1 {
            swapValue(board: &candies, i, j, "col")
            result = max(result, check(candies))
            swapValue(board: &candies, i, j, "col")
        }

        if i < n-1 {
            swapValue(board: &candies, i, j, "row")
            result = max(result, check(candies))
            swapValue(board: &candies, i, j, "row")
        }
    }
}
print(result)


func swapValue(board: inout [[String]], _ i: Int, _ j: Int, _ mode: String) {
    if mode == "col" {
        board[i].swapAt(j, j+1)
    } else if mode == "row" {
        let temp = board[i][j]
        board[i][j] = board[i+1][j]
        board[i+1][j] = temp
    }
}

func check(_ board: [[String]]) -> Int {
    var cnt: Int = 0
    var ans: Int = 1
    for i in 0..<n {
        cnt = 1
        for j in 0..<n-1 { 
            if board[i][j] == board[i][j+1] { cnt += 1 }
            else { cnt = 1 }
            ans = max(ans, cnt)
        }

        cnt = 1
        for j in 0..<n-1 {
            if board[j][i] == board[j+1][i] { cnt += 1}
            else { cnt = 1}
            ans = max(ans, cnt)
        }
    }
    return ans
}