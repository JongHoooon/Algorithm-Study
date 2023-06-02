//
//  main.swift
//  뒤에 있는 큰 수 찾기
//
//  Created by JongHoon on 2023/03/05.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = Array(repeating: -1, count: numbers.count)
    var stack: [(Int, Int)] = []
    
    for (i, n) in numbers.enumerated() {
        if !stack.isEmpty {
            while !stack.isEmpty && stack.last!.1 < n {
                result[stack.removeLast().0] = n
            }
        }
        stack.append((i, n))
    }
    return result
}

print(solution([2, 3, 3, 5]))
print(solution([9, 1, 5, 3, 6, 2]))




 































/*
 
 var answer: [Int] = Array(repeating: -1, count: numbers.count)
 var stack: [(Int, Int)] = []
 
 for (i, num) in numbers.enumerated() {
     if !stack.isEmpty {
         while !stack.isEmpty && stack.last!.1 < num {
             answer[stack.last!.0] = num
             stack.popLast()
         }
     }
     stack.append((i, num))
 }
 return answer
 */
