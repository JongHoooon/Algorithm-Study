import Foundation

func solution(_ n:Int) -> [Int] {
    var matrix: [[Int]] = [[Int]](
        repeating: [Int](repeating: 0, count: n), 
        count: n
    )
    var row = -1
    var col = 0
    var i = n
    var j = 0
    var currentNum = 1
    
    while i > 0 {
        
        j = 0
        while j < i { 
            row += 1
            matrix[row][col] = currentNum
            currentNum += 1
            j += 1
        }
        
        j = 0
        while j < i-1 { 
            col += 1
            matrix[row][col] = currentNum
            currentNum += 1
            j += 1
        }
        
        j = 0
        while j < i-2 { 
            col -= 1
            row -= 1
            matrix[row][col] = currentNum
            currentNum += 1
            j += 1
        }
        
        i -= 3
    }
    
    return matrix.flatMap { $0.filter { $0 != 0 } }
}
