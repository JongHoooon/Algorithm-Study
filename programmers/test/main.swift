//
//  main.swift
//  test
//
//  Created by JongHoon on 2023/03/08.
//

import Foundation

func solution(_ height: [Int], _ width: [Int]) -> Int64 {
    var answer: Int = -1
    
    for h in Set(height) { // n
        
        var widths = 0
        for (j, w) in width.enumerated() { // n
            if height[j] >= h {
                widths += w
            }
        }
        
        let area = widths * h
        print("area: \(area)")
        answer = area > answer ? area : answer
    }
    
    return Int64(answer)
}

print(solution([140, 21, 21, 32], [2, 1, 3, 7]))
