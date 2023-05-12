//
//  main.swift
//  과제 진행하기
//
//  Created by JongHoon on 2023/05/12.
//

import Foundation

func solution(_ plans:[[String]]) -> [String] {
        
    let plans: [(String, Int, Int)] = plans.map {
        let time = $0[1]
            .split(separator: ":")
            .map { Int($0)! }
        
        let leftTime = Int($0[2])!
        
        return ($0[0], time[0]*60 + time[1], leftTime)
    }
        .sorted(by: { $0.1 < $1.1 })
    
    var planStack: [(String, Int, Int)] = []
    var answer: [String] = []

    for plan in plans {
        
        if planStack.isEmpty {
            planStack.append((plan.0, plan.1, plan.2))
            continue
        }
        
        var leftTime = plan.1 - planStack.last!.1
        
        while !planStack.isEmpty && leftTime - planStack.last!.2 >= 0 {
            let removedPlan = planStack.removeLast()
            leftTime -= removedPlan.2
            answer.append(removedPlan.0)
        }
        
        if  !planStack.isEmpty && leftTime > 0 {
            let lastPlan = planStack.last!
            planStack[planStack.count-1] = (lastPlan.0, lastPlan.1, lastPlan.2 - leftTime)
        }
        
        planStack.append((plan.0, plan.1, plan.2))
        print(planStack)
    }
    
    return answer + planStack.map { $0.0 }.reversed()
}

print(solution([["1", "00:00", "30"], ["2", "00:10", "10"], ["3", "00:30", "10"], ["4", "00:50", "10"]]))
