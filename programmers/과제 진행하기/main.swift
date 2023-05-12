//
//  main.swift
//  과제 진행하기
//
//  Created by JongHoon on 2023/05/12.
//

//import Foundation
//
//func solution(_ plans:[[String]]) -> [String] {
//
//    let plans: [(String, Int, Int)] = plans.map {
//        let time = $0[1]
//            .split(separator: ":")
//            .map { Int($0)! }
//
//        let leftTime = Int($0[2])!
//
//        return ($0[0], time[0]*60 + time[1], leftTime)
//    }
//        .sorted(by: { $0.1 < $1.1 })
//
//    var planStack: [(String, Int, Int)] = []
//    var answer: [String] = []
//
//    for plan in plans {
//
//        if planStack.isEmpty {
//            planStack.append((plan.0, plan.1, plan.2))
//            continue
//        }
//
//        var leftTime = plan.1 - planStack.last!.1
//
//        while !planStack.isEmpty && leftTime - planStack.last!.2 >= 0 {
//            let removedPlan = planStack.removeLast()
//            leftTime -= removedPlan.2
//            answer.append(removedPlan.0)
//        }
//
//        if  !planStack.isEmpty && leftTime > 0 {
//            let lastPlan = planStack.last!
//            planStack[planStack.count-1] = (lastPlan.0, lastPlan.1, lastPlan.2 - leftTime)
//        }
//
//        planStack.append((plan.0, plan.1, plan.2))
//        print(planStack)
//    }
//
//    return answer + planStack.map { $0.0 }.reversed()
//}
//
//print(solution([["1", "00:00", "30"], ["2", "00:10", "10"], ["3", "00:30", "10"], ["4", "00:50", "10"]]))

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
        
//        if row == 3 { print(board)}
        
        // exit condition
        if row == n || col == n { return }
        if colSet.contains(col) { return }
        
        let diagInfo1 = row - col
        let diagInfo2 = row + col
        
        if row == 3 { print(board)}
        if diagSet1.contains(diagInfo1) { return }
        if diagSet2.contains(diagInfo2) { return }
        
        // process
        let strLine: String = createStrRow(col: col)
        board.append(strLine)
//        print(row, board)
        if board.count == n {
            result.append(board)
            _ = board.removeLast()
            return
        }
        
        // duplicate sets
        colSet.insert(col)
        diagSet1.insert(diagInfo1)
        diagSet1.insert(diagInfo2)
        
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

solveNQueens(4)
