//
//  main.swift
//  큰 수 만들기
//
//  Created by JongHoon on 2023/01/18.
//



import Foundation


func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var sum: Int = (1...count).reduce(0, +)
    
    return Int64(sum * price - money)
}

print(solution(3, 20, 1))
