
func solveNQueens(_ n: Int) -> [[String]] {

    var result: [[String]] = []
    var colSet: Set<Int> = []
    var diagSet1: Set<Int> = []
    var diagSet2: Set<Int> = []

    for x in 0..<n { 
        bt(row: 0, col: x, board: [])
    } 

    func createStrRow(col: Int) -> String { 
        var strArray = Array(repeating: ".", count: n)
        strArray[col] = "Q"
        return strArray.joined()
    }

    func bt(row: Int, col: Int, board: [String]) {
        var board: [String] = board

        // exit condition
        if row == n || col == n { return }
        if colSet.contains(col) { return }

        let diagInfo1 = row - col
        let diagInfo2 = row + col

        if diagSet1.contains(diagInfo1) { return }
        if diagSet2.contains(diagInfo2) { return }

        // process
        let strLine: String = createStrRow(col: col)
        board.append(strLine)

        if board.count == n { 
            result.append(board)
            _ = board.removeLast()
            return 
        }

        // duplicate sets
        colSet.insert(col)
        diagSet1.insert(diagInfo1)
        diagSet2.insert(diagInfo2)

        // recursive calls 
        for x in 0..<n { 
            bt(row: row+1, col: x, board: board)
        }

        // duplicates sets pop
        diagSet2.remove(diagInfo2)
        diagSet1.remove(diagInfo1)
        colSet.remove(col)
        _ = board.removeLast()
    }

    return result
}

print(solveNQueens(4))