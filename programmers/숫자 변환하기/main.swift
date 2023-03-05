//
//  main.swift
//  숫자 변환하기
//
//  Created by JongHoon on 2023/03/05.
//

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var set: Set<Int> = [x]
    var count: Int = 0
    
    while !set.isEmpty {
        if set.contains(y) {
           return count
        }
        var nextSet: Set<Int> = []
        for e in set {
            if e + n <= y {
                nextSet.insert(e+n)
            }
            
            if e * 2 <= y {
                nextSet.insert(e*2)
            }
            
            if e * 3 <= y {
                nextSet.insert(e*3)
            }
        }
        set = nextSet
        count += 1
    }
    return -1
}

//print(solution(10, 40, 2))

print(solution(10, 40, 30))






















































/*
 
 var x: Int = x
 var answer: Int = 0
 var set: Set<Int> = []
 set.insert(x)
 
 while !set.isEmpty {
     if set.contains(y) {
         return answer
     }
     
     var nextSet: Set<Int> = []
     for e in set {
         if e + n <= y {
             nextSet.insert(e + n)
         }
         
         if  e * 2 <= y {
             nextSet.insert(e * 2)
         }
         
         if e * 3 <= y {
             nextSet.insert(e * 3)
         }
     }
     set = nextSet
     answer += 1
 }
 return -1
 
 
 */

