//
//  main.swift
//  시소 짝꿍
//
//  Created by JongHoon on 2023/03/06.
//

import Foundation

/*
// 시간 초과
func solution(_ weights:[Int]) -> Int64 {
    let distances: [Double] = [1, 2, 3/2, 4/3]
    var count: Int = 0
    let weights: [Int] = weights.sorted()

    for (i, w) in weights.enumerated() {
    loop: for j in i+1..<weights.count {
            for d in distances {
                if d * Double(w) == Double(weights[j]) {
                    count += 1
                    continue loop
                }
            }
        }
    }
    return Int64(count)
}
*/

func solution(_ weights:[Int]) -> Int64 {
    var position: [(Int, Int)] = [(1, 1), (2, 3), (2, 4), (3, 2), (3, 4), (4, 2), (4, 3)]
    var answer: Int = 0
    var dict: [Int: Int] = [:]
    
    for w in weights {
        for p in position {
            var n = w * p.0
            guard n % p.1 == 0 else { continue }
            n /= p.1
            guard dict[n] != nil else { continue }
            answer += dict[n]!
        }
        
        if dict[w] == nil {
            dict[w] = 1
        } else {
            dict[w]! += 1
        }
    }
    
    return Int64(answer)
}

/*
 
 100: 1
 180: 1
 360: 1
 
 */


print(solution([100,180,360,100,270]))

/*
 1 3/2 2
 
 4/3
 */


















































