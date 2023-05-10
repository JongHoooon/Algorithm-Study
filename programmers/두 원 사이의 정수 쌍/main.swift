//
//  main.swift
//  두 원 사이의 정수 쌍
//
//  Created by JongHoon on 2023/05/10.
//

import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {

    var count = 0
    for y in 0...r2 {
        let x = sqrt(Double(r2 * r2) - Double(y * y))
        var sum = Int(x) * 2 + 1
        
        if y != 0 { sum *= 2 }
        
        count += sum
    }
    
    for y in 0..<r1 {
        let x = ceil(sqrt(Double(r1 * r1) - Double(y * y))) - 1
        var sum = Int(x) * 2 + 1
        
        if y != 0 { sum *= 2 }
        
        count -= sum
    }

    return Int64(count)
}

print(solution(2, 3))
