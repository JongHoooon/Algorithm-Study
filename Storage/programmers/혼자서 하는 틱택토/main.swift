//
//  main.swift
//  혼자서 하는 틱택토
//
//  Created by JongHoon on 2023/03/04.
//

import Foundation

func solution(_ board:[String]) -> Int {
    var boardArr: [[Character]] = []
    
    var OCount: Int = 0
    
    var XCount: Int = 0
    
    for row in board {
        boardArr.append(Array(row))
        for c in row {
            if c == "." { continue }
            if c == "O" { OCount += 1 }
            if c == "X" { XCount += 1 }
        }
    }
    
    // 선공이 후공보다 적거나 후공보다 2개 이상 앞설 경우
    if OCount < XCount || OCount > XCount + 1 { return 0 }
    
    var OBingo = 0
    var XBingo = 0
    
    for row in 0..<3 {
        // 가로 빙고
        if boardArr[row][0] != "." && boardArr[row][0] == boardArr[row][1] && boardArr[row][1] == boardArr[row][2] {
            if boardArr[row][0] == "O" { OBingo += 1 }
            else { XBingo += 1 }
        }
        
        // 세로 빙고
        if boardArr[0][row] != "." && boardArr[0][row] == boardArr[1][row] && boardArr[1][row] == boardArr[2][row] {
            if boardArr[0][row] == "O" { OBingo += 1 }
            else { XBingo += 1 }
        }
    }
    
    // 대각 빙고
    if boardArr[1][1] == "O" {
        if boardArr[0][0] == boardArr[1][1] && boardArr[1][1] == boardArr[2][2] { OBingo += 1}
        if boardArr[0][2] == boardArr[1][1] && boardArr[1][1] == boardArr[2][0] { OBingo += 1}
    } else if boardArr[1][1] == "X" {
        if boardArr[0][0] == boardArr[1][1] && boardArr[1][1] == boardArr[2][2] { XBingo += 1}
        if boardArr[0][2] == boardArr[1][1] && boardArr[1][1] == boardArr[2][0] { XBingo += 1}
    }
    
//    if OBingo == 2 { return 1 }
//
//    // 빙고에 성공한 줄이 2개보다 많을때
//    if OBingo + XBingo >= 2 { return 0 }
    
    if OBingo != 0 && XBingo != 0 { return 0 }
    
    // O의 승리에서 O의 개수와 X의 개수가 같은경우
    if OBingo == 1 && OCount <= XCount { return 0 }
    
    // X의 승리에서 O의 개수가 X의 개수보다 많은 경우
    if XBingo == 1 && OCount > XCount { return 0 }
    
    return 1
}

print(solution(["O.X", ".O.", "..X"]))
print(solution(["OOO", "...", "XXX"]))
print(solution(["...", ".X.", "..."]))
print(solution(["...", "...", "..."]))
print(solution(["O.O", ".O.", "O.O"]))
print(solution(["OXO", "XOX", "OXO"]))
print(solution(["XOX", "OOO", "XOX"]))

/*
 
1. o 선공
 
2. 끝낫는데 진행
 
*/

