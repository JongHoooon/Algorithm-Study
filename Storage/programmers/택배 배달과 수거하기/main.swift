//
//  main.swift
//  택배 배달과 수거하기
//
//  Created by JongHoon on 2023/03/06.
//

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var deliveries: [Int] = deliveries
    var pickups: [Int] = pickups
    var answer: Int = 0
    
    while !deliveries.isEmpty || !pickups.isEmpty {
        deliveries.trimZeroSuffix()
        pickups.trimZeroSuffix()
        
        answer += max(deliveries.count, pickups.count) * 2
        var load = 0
        
        while (!deliveries.isEmpty && load < cap) {
            if deliveries.last! + load <= cap {
                load += deliveries.removeLast()
            } else {
                deliveries[deliveries.count-1] = deliveries.last! - (cap - load)
                load += cap - load
            }
        }
        
        load = 0
        while !pickups.isEmpty && load < cap {
            if pickups.last! + load <= cap {
                load += pickups.removeLast()
            } else {
                pickups[pickups.count-1] = pickups.last! - (cap - load)
                load += cap - load
            }
        }
    }
    
    return Int64(answer)
}

extension Array where Element == Int {
    mutating func trimZeroSuffix() {
        while self.last ?? -1 == 0 {
            let _ = self.popLast()
        }
    }
}


print(solution(4, 5, [1, 0, 3, 1, 2], [0, 3, 0, 4, 0]))

print(solution(2, 7, [1, 0, 2, 0, 1, 0, 2], [0, 2, 0, 1, 0, 2, 0]))

/*
 
 ;
 
 제일 먼데 먼가 가져다 주고 회수해서 온다
 
 pop 사용
 
 */
