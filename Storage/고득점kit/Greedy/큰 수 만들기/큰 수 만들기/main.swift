//
//  main.swift
//  큰 수 만들기
//
//  Created by JongHoon on 2023/01/18.
//



func exist(_ board: [[Character]], _ word: String) -> Bool {

    if word.count == 0 { return true }
    
    let rows: Int = board.count
    if rows == 0 { return false }

    let cols: Int = board[0].count
    if cols == 0 { return false }

    let word: [Character] = Array(word)
    var isVisited: [[Bool]] = Array(
        repeating: Array(repeating: false, count: cols),
        count: rows
    )

    func bt(y: Int, x: Int, idx: Int) -> Bool {

        if idx == word.count {
            return true
        } else if !((0..<board.count) ~= y) {
            return false
        } else if !((0..<board[0].count) ~= x) {
            return false
        } else if isVisited[y][x] {
            return false
        } else if board[y][x] != word[idx] {
            return false
        }

        isVisited[y][x] = true

        if bt(y: y-1, x: x, idx: idx+1) {
            return true
        } else if bt(y: y, x: x+1, idx: idx+1) {
            return true
        } else if bt(y: y+1, x: x, idx: idx+1) {
            return true
        } else if bt(y: y, x: x-1, idx: idx+1) {
            return true
        }
        isVisited[y][x] = false

        return false
     }

    for y in 0..<rows {
        for x in 0..<cols {
            let answer = bt(y: y, x: x, idx: 0)
            if answer { return answer }
        }
    }

    return false
}

print(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
