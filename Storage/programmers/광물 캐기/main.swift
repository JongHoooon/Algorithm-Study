//
//  main.swift
//  광물 캐기
//
//  Created by JongHoon on 2023/05/13.
//

import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    
    var picks = picks
    var minerals: [Int] = minerals.map {
        switch $0 {
        case "diamond": return 0
        case "iron":    return 1
        case "stone":   return 2
        default:        return -1
        }
    }
    
    let diamondFatigue: [Int] = [1, 1, 1]
    let ironFatigue: [Int] = [5, 1, 1]
    let stoneFatigue: [Int] = [25, 5, 1]
    let fatigues: [[Int]] = [
        diamondFatigue,
        ironFatigue,
        stoneFatigue
    ]
    
    let pickCount: Int = min(Int(ceil(Double(minerals.count) / 5.0)), picks.reduce(0, +))
    var picked: [Int] = []
    var answer: Int = Int.max
        
    func dfs(count: Int) {
        
        if count == pickCount {
            countFatigue()
            return
        }
        
        for (i, n) in picks.enumerated() {
            if n > 0 {
                picks[i] = n - 1
                picked.append(i)
                dfs(count: count + 1)
                picks[i] = n
                _ = picked.removeLast()
            }
        }
    }
    
    func countFatigue() {
        
        var sum: Int = 0
        for (i, mineral) in minerals.enumerated() {
            guard i < pickCount * 5 else { break }
            
            let currentPick = picked[i / 5]
            sum += fatigues[currentPick][mineral]
        }

        answer = min(answer, sum)
    }
    
    dfs(count: 0)
    
    return answer
}
