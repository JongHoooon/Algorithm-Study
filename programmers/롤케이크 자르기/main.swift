//
//  main.swift
//  롤케이크 자르기
//
//  Created by JongHoon on 2023/03/11.
//

import Foundation

/**
 시간초과
 */
//func solution(_ topping:[Int]) -> Int {
//    var count: Int = 0
//
//    for i in 1...topping.count {
//        let l = Set(topping[0..<i])
//        let r = Set(topping[i..<topping.count])
//        if l.count == r.count { count += 1 }
//    }
//
//    return count
//}


/**
 dictionary 사용
 */
func solution(_ topping:[Int]) -> Int {
    var dic1 = topping.reduce(into: [Int: Int]()) {
        $0[$1, default: 0] += 1
    }
    var dic2: [Int: Int] = [:]

    return topping.reduce(0) { answer, topping in
        dic1[topping] = dic1[topping] == 1 ? nil : dic1[topping]! - 1
        dic2[topping, default: 0] += 1
        return dic1.count == dic2.count ? answer + 1 : answer + 0
    }
}
    
    
/**
 배열 사용해서 해결
 */
//func solution(_ topping:[Int]) -> Int {
//    var answer = 0
//    var s1: Set<Int> = []
//    var s2: Set<Int> = Set(topping)
//
//    let maxValue = topping.max()!
//    var toppingArr = Array(repeating: 0, count: maxValue+1)
//    for t in topping {
//        toppingArr[t] += 1
//    }
//
//    for t in topping {
//        s1.insert(t)
//        toppingArr[t] -= 1
//        if toppingArr[t] <= 0 {
//            s2.remove(t)
//        }
//        if s1.count == s2.count { answer += 1}
//    }
//
//    return answer
//}





print(solution([1, 2, 1, 3, 1, 4, 1, 2]))

print(solution([1, 2, 3, 1, 4]))

/**
 [1, 2, 3, 1, 4]
 
 */
