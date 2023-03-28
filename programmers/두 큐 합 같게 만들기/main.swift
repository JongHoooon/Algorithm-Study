//
//  main.swift
//  두 큐 합 같게 만들기
//
//  Created by JongHoon on 2023/03/28.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var array: [Int] = []
    array.append(contentsOf: queue1)
    array.append(contentsOf: queue2)
    var target = 0
    if array.reduce(0, +) % 2 != 0 {
        return -1
    } else {
        target = array.reduce(0, +) / 2
    }
    
    var left = 0
    var right = queue1.count - 1
    var sum: Int = queue1.reduce(0, +)
    var count: Int = 0
    let limit: Int = queue1.count + queue2.count - 1
    
    while left < limit && right < limit {
        if sum == target { return count }
        
        if sum < target {
            right += 1
            sum += array[right]
        } else {
            sum -= array[left]
            left += 1
        }
        count += 1
    }
    
    return -1
}

