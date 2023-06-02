//
//  main.swift
//  우박수열 정적분
//
//  Created by JongHoon on 2023/03/07.
//

import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    let collatz = getCollatz(k)
    let start = 0
    let end = collatz.count
    var answer: [Double] = []
    
    for r in ranges {
        let newStart = start+r[0]
        let newEnd = end+r[1]
    
        if !(start...end ~= newStart) || !(start...end ~= newEnd) || newStart >= newEnd {
            answer.append(-1)
            continue
        }
        let arr = collatz[newStart..<newEnd]
        answer.append(Double(arr.reduce(0, +) * 2 - arr.first! - arr.last!)/Double(2))
    }

    return answer
}

func getCollatz(_ n: Int) -> [Int] {
    var n: Int = n
    var arr: [Int] = [n]
    while n != 1 {
        n = n % 2 == 0 ? n / 2 : n * 3 + 1
        arr.append(n)
    }
    return arr
}


print(solution(5, [[0,0],[0,-1],[2,-3],[3,-3]]))
