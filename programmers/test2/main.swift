//
//  main.swift
//  test2
//
//  Created by JongHoon on 2023/03/08.
//

import Foundation

func solution(_ rectangles: [[Int]]) -> [String] {
    var rectanglesDict: [Int: [Int]] = [:]
    
    for (i, r) in rectangles.enumerated() {
        rectanglesDict[i] = r
    }
    
    let rectanglesXSorted = rectanglesDict.sorted(by: { $0.value[1] < $1.value[1] }) // n
    
    
    
    var movedFirst: [Int: [Int]] = [:]
    for dict in rectanglesXSorted {
        let r = dict.value
        
        let largestDict = movedFirst
            .filter { r[0]..<r[2] ~= $0.value[0] || r[0]+1...r[2] ~= $0.value[2] }
            .max(by: { $0.value[3] < $1.value[3] })
            
        guard let largestRectangle = largestDict?.value else {
            movedFirst[dict.key] = [r[0], 0, r[2], r[3]-r[1]]
            continue
        }
        
        movedFirst[dict.key] = [r[0], largestRectangle[3], r[2], largestRectangle[3]+r[3]-r[1]]
        
        print("now: \(r), largestRectangle: \(largestRectangle)")
    }
    
    print("moveFirst: \(movedFirst.sorted(by: { $0.key < $1.key }))")
    
    
    let rectanglesYSorted = movedFirst.sorted(by: { $0.value[0] < $1.value[0] }) // n

    var movedSecond: [Int: [Int]] = [:]
    for dict in rectanglesYSorted {
        let r = dict.value

        let largestDict = movedSecond
            .filter { r[1]..<r[3] ~= $0.value[1] || r[1]+1...r[3] ~= $0.value[3] }
            .max(by: { $0.value[2] < $1.value[2] })

        guard let largestRectangle = largestDict?.value else {
            movedSecond[dict.key] = [0, r[1], r[2]-r[0], r[3]]
            continue
        }

        movedSecond[dict.key] = [largestRectangle[2], r[1], largestRectangle[2]+r[2]-r[0], r[3]]

        print("now: \(r), largestRectangle: \(largestRectangle)")
    }
    
//    print(movedSecond.sorted(by: { $0.key < $1.key }))
    
    let answer = movedSecond
        .sorted(by: { $0.key < $1.key })
        .map {
            $0.value
                .map { String($0) }
                .joined(separator: " ")
        }
        
    
    print("")
    print("")
    print("")
    
    print(answer)
    
    return answer
}


solution([[0,2,1,3], [1,6,5,7], [3,3,4,4], [4,1,6,3], [1,2,2,5], [5,5,7,6], [5,8,6,10]])


