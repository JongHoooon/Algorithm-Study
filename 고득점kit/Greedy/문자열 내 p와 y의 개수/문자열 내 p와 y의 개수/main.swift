//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by JongHoon on 2023/01/21.
//

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    let intervals: [[Int]] = intervals.sorted(by: { $0[0] < $1[0] })
    var answer: [[Int]] = []

    for interval in intervals {
        guard let last = answer.last else {
            answer.append(interval)
            continue
        }
        if interval[0] <= last[1] && interval[1] >= last[1] {
            answer[answer.count-1] = [last[0], interval[1]]
        } else if interval[0] > last[1] {
            answer.append(interval)
        }
    }

    return answer
}

print(merge([[1,3],[2,6],[8,10],[15,18]]))
