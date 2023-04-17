//
//  main.swift
//  입국심사
//
//  Created by JongHoon on 2023/04/15.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted()
    var maxTime = times.last! * n
    var minTime = 1
    var result = 0
    
    while minTime <= maxTime {
        let midTime = (minTime + maxTime) / 2
        var sum = 0
        times.forEach {
            sum += midTime / $0
        }
        if sum < n {
            minTime = midTime + 1
        } else {
            maxTime = midTime - 1
            result = midTime
        }
    }
    
    return Int64(result)
}

print(solution(6, [7, 10]))
