//
//  main.swift
//  요격 시스템
//
//  Created by JongHoon on 2023/05/09.
//

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    
    let sortedTargets = targets.sorted(by: { $0[0] < $1[0] })
    
    var startIdx: Int = 0
    var endIdx: Int = 0
    var count: Int = 0
    
    for target in sortedTargets {
        
        if startIdx <= target[0] && target[0] < endIdx {
            startIdx = target[0]
            endIdx = min(endIdx, target[1])
        } else {
            count += 1
            startIdx = target[0]
            endIdx = target[1]
        }
    }
    
    return count
}

print(solution([[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]]))
