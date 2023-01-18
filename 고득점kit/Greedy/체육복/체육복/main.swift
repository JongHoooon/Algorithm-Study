//
//  main.swift
//  체육복
//
//  Created by JongHoon on 2023/01/11.
//


func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var checkArray = Array(repeating: 1, count: 5)
    
    for i in lost {
        checkArray[i - 1] -= 1
    }
    for i in reserve {
        checkArray[i - 1] += 1
    }
    
    var count = 0
    for i in 0..<n {
        if checkArray[i] == 0 {
            if i > 0 && checkArray[i-1] > 1 {
                checkArray[i] = 1
                checkArray[i-1] -= 1
            } else if i < n-1 && checkArray[i+1] > 1 {
                checkArray[i] = 1
                checkArray[i+1] -= 1
            } else {
                count += 1
            }
        }
    }
    return n - count
}



/*
 
import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    // lost와 중복이 없는
    let newReserve = reserve.filter { !lost.contains($0) }
    let newLost = lost.filter { !reserve.contains($0) }

    var lostPeople: Int = newLost.count

    newReserve.forEach {
        let isLend: Bool = newLost.contains($0 - 1) || newLost.contains($0 + 1)
        if isLend && lostPeople > 0 {
            lostPeople -= 1
        }
    }

    return n - lostPeople
}

 */
