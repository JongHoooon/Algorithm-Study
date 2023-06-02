//
//  main.swift
//  피로도
//
//  Created by JongHoon on 2023/04/13.
//

import Foundation

/*
func combination(_ n: Int) -> [[Int]] {
    var result: [[Int]] = []

    func combi(_ arr: [Int]) {
        if arr.count == n {
            result.append(arr)
            return
        } else {
            for i in 0..<n {
                if !arr.contains(i) {
                    combi(arr + [i])
                }
            }
        }
    }
    combi([])

    return result
}

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    let combination = combination(dungeons.count)
    var answer: Int = 0
    
    for c in combination {
        var k: Int = k
        var count: Int = 0
        
        for idx in c {
            let d = dungeons[idx]
            if k >= d[0] {
                k -= d[1]
                count += 1
            }
        }
        answer = max(answer, count)
    }
    
    
    return answer
}
 */


func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
        
    var answer: Int = 0
    var isVisited: [Bool] = Array(repeating: false, count: dungeons.count)
    
    func dfs(level: Int, k: Int) {
        if k <= 0 { return }
        if level >= dungeons.count {
            answer = level
            return
        } else {
            for i in 0..<dungeons.count {
                let need = dungeons[i][0]
                let cost = dungeons[i][0]
                
                if k >= need && isVisited[i] == false {
                    isVisited[i] = true
                    dfs(level: i, k: k - cost)
                    let count = isVisited.filter { $0 == true }.count
                    isVisited[i] = false
                    answer = max(count, answer)
                }
            }
        }
    }
    
    dfs(level: 0, k: k)
    
    return answer
}




print(solution(80, [[80,20],[50,40],[30,10]]))
