//
//  main.swift
//  practice
//
//  Created by JongHoon on 2023/06/05.
//

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    let scores = Array((0...10).reversed())
    
    var scoreCount: Int = 0
    var result: [Int] = [-1]
    let shots: [Int] = Array(repeating: 0, count: info.count)
    
    func dfs(_ idx: Int, _ count: Int, _ shots: [Int]) {
        var shots = shots
        shots[idx] += 1
        if count == n {
            let score = countScore(shots)
            
            if score != 0 && score == scoreCount {
                for i in (0..<info.count).reversed() {
                    guard shots[i] != 0 || result[i] != 0 else { continue }
                    guard shots[i] != result[i] else { continue }
                    
                    if shots[i] > result[i] {
                        result = shots
                        break
                    } else {
                        break
                    }
                }
            } else if score > scoreCount{
                scoreCount = score
                result = shots
            }
        
            return
        }
        
        for i in idx..<info.count {
            dfs(i, count + 1, shots)
        }
    }
    
    func countScore(_ shots: [Int]) -> Int {
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
        dfs(i, 1, shots)
    }
    
    return result
}

print(solution(5, [2,1,1,1,0,0,0,0,0,0,0]))
