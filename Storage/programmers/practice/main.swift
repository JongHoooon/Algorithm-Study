//
//  main.swift
//  practice
//
//  Created by JongHoon on 2023/06/05.
//

import Foundation

var apichArray: [Int] = Array(repeating: 0, count: 11)
var lionArray: [Int] = Array(repeating: 0, count: 11)
var answer = [-1]
var maxScore = 0

func calculateScore() {
    var lionScore = 0
    var apichScore = 0

    for idx in 1...10 {
        if apichArray[idx] == 0 && lionArray[idx] == 0 {
            continue
        }

        if lionArray[idx] > apichArray[idx] {
            lionScore += idx
        } else {
            apichScore += idx
        }
    }

    if lionScore - apichScore > maxScore {
        maxScore = lionScore - apichScore
        answer = lionArray
    }
}

func bruteForce(_ previousIdx: Int, _ remainArrow: Int) {
    if remainArrow == 0 {
        calculateScore()
        return
    }
    
    if previousIdx == 10 {
        return
    }
    
    for nextIdx in previousIdx+1...10 {
        for arrow in 0...remainArrow {
            lionArray[nextIdx] = remainArrow - arrow
            bruteForce(nextIdx, arrow)
            lionArray[nextIdx] = 0
        }
    }
}

func solution2(_ n:Int, _ info:[Int]) -> [Int] {
    apichArray = info.reversed() // 점수 오름차순으로 변경
    bruteForce(-1, n)
    return answer.reversed()
}

print(solution2(5, [2,1,1,1,0,0,0,0,0,0,0]))
