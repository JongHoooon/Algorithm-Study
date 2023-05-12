
func solveSudoku(_ board: inout [[Character]]) {

    let next = findNextEmpty()
    if next[0] == 9 && next[1] == 9 { 
        return
    }

    for i in 1..<9 { 
        let num = Character(String(i))
        bt(row: next[0], col: next[1], num: num)
    }

    func checkRow(row: Int, num: Character) -> Bool {
        for x in 0..<9 { 
            if board[row][x] == num { 
                return false
            }
        }
        return true
    }
    
    func checkCol(col: Int, num: Character) -> Bool {
        for y in 0..<9 { 
            if board[y][col] == num { 
                return false
            }
        }
        return true
    }

    func check33(row: Int, col: Int, num: Character) -> Bool { 
        let boxX = Int(col/3) * 3
        let boxY = Int(row/3) * 3 

        for y in boxY..<boxY+3 { 
            for x in boxX..<boxX+3 { 
                if board[y][x] == num { 
                    return false
                }
            }
        }
        return true
    }

    func findNextEmpty() -> [Int] { 
        for y in 0..<9 {
            for x in 0..<9 {
                if board[y][x] == "." { 
                    return [y, x]
                }
            }
        }
        return [9, 9]
    }

    func bt(row: Int, col: Int, num: Character) -> Bool { 
        if !checkRow(row: row, num: num) { return false }
        if !checkCol(col: col, num: num) { return false }
        if !check33(row: row, col: col, num: num) { return false }

        board[row][col] = num
        let next = findNextEmpty()
        let nextRow = next[0]
        let nextCol = next[1]

        // Sudoku solved!
        if nextRow == 9 && nextCol == 9 { return true }

        // next function cell
        for nextNum in 1..<10 { 
            let nextNum = Character(String(nextNum))
            if bt(row: nextRow, col: nextCol, num: nextNum) { 
                return true
            }
        }

        // rollback when all cadiates returned False
        board[row][col] = "."
        return false
    }
}
