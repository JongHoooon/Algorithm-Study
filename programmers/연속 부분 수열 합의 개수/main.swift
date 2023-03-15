//
//  main.swift
//  연속 부분 수열 합의 개수
//
//  Created by JongHoon on 2023/03/15.
//

import Foundation

func solution(_ elements:[Int]) -> Int {
    var result = Set(elements)
    var arr = elements
    
    for n in 1..<elements.count {
        arr.append(elements[n-1])
        for i in 0..<elements.count {
            var sum = 0
            for j in 0...n {
                sum += arr[i+j]
            }
            result.insert(sum)
        }
    }
    return result.count
}

print(solution([7, 9, 1, 1, 4]))
print(solution([]))


/*
 1
 4
 7
 9
 
 7
 9
 1
 1
 4
 7
 
 

 */
