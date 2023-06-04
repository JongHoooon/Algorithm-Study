//
//  main.swift
//  리코쳇 로봇
//
//  Created by JongHoon on 2023/03/19.
//

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    let scores = Array((0...10).reversed())
    
    var scoreCount: Int = 0
    var result: [Int] = [-1]
    var shots: [Int] = Array(repeating: 0, count: info.count)
    
    func dfs(_ idx: Int, _ count: Int) {
        if count == n {
            let score = countScore()
            print(shots, score)
            if score > scoreCount {
                scoreCount = score
                result = shots
            }
            
            return
        }
        
        shots[idx] += 1
        for i in 0..<info.count {
            dfs(i, count + 1)
        }
        shots[idx] -= 1
    }
    
    func countScore() -> Int {
        var aScore: Int = 0
        var lScore: Int = 0
        for i in 0..<info.count {
            
            if info[i] == 0 && shots[i] == 0 {
                continue
            }
            
            let score = scores[i]
            if info[i] >= shots[i] {
                aScore += score
            } else {
                lScore += score
            }
        }
        
        return lScore - aScore
    }
    
    
    for i in 0..<info.count {
        dfs(i, 0)
    }
    
    return result
}

print(solution(9, [0, 0, 1, 2, 0, 1, 1, 1, 1, 1, 1]))

/*
 
 - 차단, 신고 분리
 - 실제 사용하는거 처럼 가로, 세로, 높이
 - 
 
 */
