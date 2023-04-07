func minPathSum(_ grid: [[Int]]) -> Int {
    let rows: Int = grid.count
    let cols: Int =  grid[0].count
    var minCost2d: [[Int]] = Array(
        repeating: Array(repeating: 0, count: cols), 
        count: rows
    )

    minCost2d[0][0] = grid[0][0]
    for colIdx in 1..<cols { 
        minCost2d[0][colIdx] = grid[0][colIdx] + minCost2d[0][colIdx-1]
    }
    for rowIdx in 1..<rows { 
        minCost2d[rowIdx][0] = grid[rowIdx][0] + minCost2d[rowIdx-1][0]
    }
    
    for rowIdx in 1..<rows { 
        for colIdx in 1..<cols { 
            let preRow = rowIdx - 1
            let preCol = colIdx - 1
            let cost = min(
                minCost2d[preRow][colIdx],
                minCost2d[rowIdx][preCol]
            )
            minCost2d[rowIdx][colIdx] = cost + grid[rowIdx][colIdx]
        }
    }

    return minCost2d[rows-1][cols-1]
}

