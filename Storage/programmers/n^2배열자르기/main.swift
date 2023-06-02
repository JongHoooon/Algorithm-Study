//
//  main.swift
//  n^2배열자르기
//
//  Created by JongHoon on 2023/04/14.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    let left = Int(left)
    let right = Int(right)
    
    var answer: [Int] = []
    for num in left...right {
        let s = num / n
        let r = num % n
        
        if s >= r { answer.append(s+1) }
        else { answer.append(r+1) }
    }
    
    return answer
}

