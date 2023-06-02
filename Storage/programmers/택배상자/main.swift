//
//  main.swift
//  택배상자
//
//  Created by JongHoon on 2023/03/11.
//

import Foundation

func solution(_ order:[Int]) -> Int {
    var beltStack: [Int] = []
    var max: Int = 0
    var count: Int = 0
    
    for box in order {
        if beltStack.last == box {
            count += 1
            let _ = beltStack.removeLast()
        } else if max < box {
            count += 1
            for b in max+1..<box {
                beltStack.append(b)
            }
            max = box
        } else {
            break
        }
    }
    return count
}

print(solution([4, 3, 1, 2, 5]))
print(solution([5, 4, 3, 2, 1]))
print(solution([2, 1, 5, 4, 3]))
print(solution([2, 1, 5, 3, 4]))
//print(solution([2, 1, 3, 4, 5]))
print(solution([1,2,3,4,5]))
print(solution([3, 2, 1, 5, 4]))
//print(solution([3,5,4,2,1]))

// 21  345
// 21 543
// 543 12

/*
 12345
 
 
 */
