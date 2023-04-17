//
//  main.swift
//  위장
//
//  Created by JongHoon on 2023/04/17.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var clothesTable: [String: Int] = [:]
    
    for c in clothes {
        clothesTable[c[1], default: 0] += 1
    }
    
    let values: [Int] = Array(clothesTable.values)
        
    if values.count == 1 {
        return values[0]
    } else {
        return values.reduce(1, { $0 * ($1+1) }) - 1
    }
}

print(solution(
    [["yellow_hat", "headgear"],
     ["blue_sunglasses", "eyewear"],
     ["green_turban", "headgear"]]
))

print(solution(
    [["crow_mask", "face"],
     ["blue_sunglasses", "face"],
     ["smoky_makeup", "face"]]
))
