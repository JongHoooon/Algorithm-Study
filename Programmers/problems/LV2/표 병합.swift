import Foundation

func solution(_ commands:[String]) -> [String] {
    
    let commands: [[String]] = commands.map { $0.components(separatedBy: " ") }
    
    var table: [[String]] = Array(
        repeating: Array(repeating: "", count: 50),
        count: 50
    )
    var mergedTable: [[(r: Int, c: Int)]] = Array(
        repeating: Array(repeating: (0, 0), count: 50),
        count: 50
    )
    for r in 0..<50 {
        for c in 0..<50 {
            mergedTable[r][c] = (r, c)
        }
    }
    
    var answer: [String] = []
    
    for command in commands {
        switch command[0] {
        case "UPDATE":
            if command.count == 4 {
                let r = Int(command[1])!-1
                let c = Int(command[2])!-1
                let idx = mergedTable[r][c]
                let value = command[3]
                
                table[idx.r][idx.c] = value
            } else {
                let value1 = command[1]
                let value2 = command[2]
                
                for r in 0..<50 {
                    for c in 0..<50 {
                        let idx = mergedTable[r][c]
                        if table[idx.r][idx.c] == value1 { 
                            table[idx.r][idx.c] = value2
                        }
                    }
                }
            }
            
        case "MERGE":
            let r1 = Int(command[1])!-1
            let c1 = Int(command[2])!-1
            let r2 = Int(command[3])!-1
            let c2 = Int(command[4])!-1
                        
            if r1 == r2 && c1 == c2 { continue }
            
            let idx1 = mergedTable[r1][c1]
            let idx2 = mergedTable[r2][c2]
            
            if table[idx1.r][idx1.c].isEmpty && !table[idx2.r][idx2.c].isEmpty { 
                for i in 0..<50 { 
                    for j in 0..<50 { 
                        if mergedTable[i][j] == (idx1.r, idx1.c) { 
                            mergedTable[i][j] = (idx2.r, idx2.c)
                        }
                    }
                }
            } else {
                for i in 0..<50 { 
                    for j in 0..<50 { 
                        if mergedTable[i][j] == (idx2.r, idx2.c) { 
                            mergedTable[i][j] = (idx1.r, idx1.c)
                        }
                    }
                }
            }

        case "UNMERGE":
            let r = Int(command[1])!-1
            let c = Int(command[2])!-1
            let idx = mergedTable[r][c]
            let temp = table[idx.r][idx.c]
            for i in 0..<50 {
                for j in 0..<50 { 
                    if mergedTable[i][j] == idx { 
                        mergedTable[i][j] = (i, j) 
                        table[i][j] = ""
                    }
                }
            }
            table[r][c] = temp
            
        case "PRINT":
            let r = Int(command[1])!-1
            let c = Int(command[2])!-1
            let idx = mergedTable[r][c] 
            let value = table[idx.r][idx.c].isEmpty ? "EMPTY" : table[idx.r][idx.c]
            answer.append(value)
            
        default:
            break
        }
    }
    
    return answer
}

print(solution(["UPDATE 1 1 a", "UPDATE 1 2 b", "UPDATE 2 1 c", "UPDATE 2 2 d", "MERGE 1 1 1 2", "MERGE 2 2 2 1", "MERGE 2 1 1 1", "PRINT 1 1", "UNMERGE 2 2", "PRINT 1 1"]))