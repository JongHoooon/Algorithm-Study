//
//  main.swift
//  연속된 부분 수열의 합
//
//  Created by JongHoon on 2023/05/10.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    var startIdx: Int = 0
    var endIdx: Int = 0
    var sum: Int = 0
    
    var answer: [Int] = [0, sequence.count]
    
    for (i, n) in sequence.enumerated() {
        
        endIdx = i
        sum += n
        
        if sum == k {
            if endIdx - startIdx < answer[1] - answer[0] {
                answer[0] = startIdx
                answer[1] = endIdx
            }
        } else if sum > k {
            
            while sum > k {
                sum -= sequence[startIdx]
                startIdx += 1
            }
            if sum == k {
                if endIdx - startIdx < answer[1] - answer[0] {
                    answer[0] = startIdx
                    answer[1] = endIdx
                }
            }
        }
    }
    
    return answer
}

