//
//  main.swift
//  큰 수 만들기
//
//  Created by JongHoon on 2023/01/18.
//



import Foundation


/*
// TC: n^2
func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var defaultWantDict: [String: Int] = [:]
    for i in 0..<want.count {
        defaultWantDict[want[i]] = number[i]
    }
    var wantDict = defaultWantDict
    var startIdx: Int = 0
    var answer: Int = 0
    
    for (i, product) in discount.enumerated() {
        guard let count = wantDict[product] else {
            startIdx = i + 1
            wantDict = defaultWantDict
            continue
        }
        
        if count == 0 {
            while discount[startIdx] != product {
                wantDict[discount[startIdx]]! += 1
                startIdx += 1
            }
            startIdx += 1
            continue
        }
        
        wantDict[product] = count - 1
        if i - startIdx + 1 == 10 {
            wantDict[discount[startIdx]]! += 1
            startIdx += 1
            answer += 1
        }
    }
    
    return answer
}
*/


// TC: NM, N: discount 길이, M: wain길이
func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var answer = 0
    
    for i in 0..<(discount.count - 9) {
        var temp = Array(repeating: 0, count: want.count)
        for j in i..<(i+10) {
            if let idx = want.firstIndex(of: discount[j]) {
                temp[idx] += 1
            }
        }
        if number == temp {
            answer += 1
        }
    }
    
    return answer
}

print(solution(
    ["banana", "apple", "rice", "pork", "pot"],
    [3, 2, 2, 2, 1],
    ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]
))
