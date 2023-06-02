//
//  main.swift
//  기능개발
//
//  Created by JongHoon on 2023/04/17.
//

import Foundation

/*
 
// stack 사용
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var stack: [Int] = []
    var answer: [Int] = []
    
    var lastReleaseDay = Int(ceil(Float(100 - progresses[0]) / Float(speeds[0])))
    for (i, progress) in progresses.enumerated() {
        let speed: Int = speeds[i]
        let leftDays = Int(ceil(Float(100 - progress) / Float(speed)))
        
        if lastReleaseDay < leftDays {
            var count: Int = 0
            while !stack.isEmpty && lastReleaseDay < leftDays {
                let _ = stack.removeLast()
                count += 1
            }
            lastReleaseDay = leftDays
            answer.append(count)
        }
    
        stack.append(leftDays)
    }
    
    if !stack.isEmpty {
        answer.append(stack.count)
    }
    
    return answer
}
 */

// queue 사용
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var queue: [Int] = []
    var answer: [Int] = []
    
    for (i, progress) in progresses.enumerated() {
        let speed: Int = speeds[i]
        let leftDays = Int(ceil(Float(100 - progress) / Float(speed)))
        let firstLeftDay = queue.first ?? Int.max
        
        if firstLeftDay < leftDays {
            var count: Int = 0
            while !queue.isEmpty && firstLeftDay < leftDays {
                let _ = queue.removeFirst()
                count += 1
            }
            answer.append(count)
        }
    
        queue.append(leftDays)
    }
    
    if !queue.isEmpty {
        answer.append(queue.count)
    }
    
    return answer
}


print(solution([93, 30, 55], [1, 30, 5]))
print("--------------")
print(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))
print("------------------")
print(solution([90, 90, 90, 90], [30, 1, 1, 1]))
//print("----------------")
//print(solution([95, 95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1, 1]))
print("--------------")
print(solution([1,1,50], [100,2,1]))
