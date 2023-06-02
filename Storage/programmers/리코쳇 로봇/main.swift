//
//  main.swift
//  리코쳇 로봇
//
//  Created by JongHoon on 2023/03/19.
//

import Foundation

func solution2(_ cards:[Int]) -> Int {

    let cards = cards.map { $0 - 1 }
    var isVisited: [Bool] = Array(repeating: false, count: cards.count)

    func dfs1(_ idx: Int) -> Int {
        var count = 1
        if isVisited[idx] == true {
            return count
        }

        let next = cards[idx]
        count += dfs1(next)
        return count
    }

    func dfs2(_ idx: Int) -> Int {
        var count = 1
        if isVisited[idx] == true {
            return count
        }

        let next = cards[idx]
        count += dfs1(next)
        isVisited[idx] = false
        return count
    }

    var answer = 0
    for i in cards.indices {
        let first = dfs1(i)
        if first == cards.count { break }

        var second = 0
        for j in cards.indices {
            guard isVisited[j] == false else { continue }
            let count = dfs2(j)
            second = max(second, count)
        }

        answer = max(answer, first * second)
        isVisited = Array(repeating: false, count: cards.count)
    }

    return answer
}

print(solution2([8,6,3,7,2,5,1,4]))
