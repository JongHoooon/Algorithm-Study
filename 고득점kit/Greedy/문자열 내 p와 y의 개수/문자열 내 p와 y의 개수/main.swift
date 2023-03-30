//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by JongHoon on 2023/01/21.
//

import Foundation

func countingSortByDigit(nums: [Int], digit: Int) -> [Int] {
    let powed: Int = Int(pow(Double(10), Double(digit)))
    var counts: [Int] = Array(repeating: 0, count: 10)
    for num in nums {
        let countIdx: Int = num / powed % 10
        counts[countIdx] += 1
    }

    var accessCounts: [Int] = []
    var accessCount: Int = 0
    for count in counts {
        accessCount += count
        accessCounts.append(accessCount)
    }
    accessCounts = accessCounts.map { $0 - 1}
    var sorted: [Int] = Array(repeating: 0, count: nums.count)

    for num in nums.reversed() {
        let countIdx: Int = num / powed % 10
        let endLoc: Int = accessCounts[countIdx]
        sorted[endLoc] = num
        accessCounts[countIdx] -= 1
    }
    return sorted
}

func radixSort(nums: [Int]) -> [Int] {
    let maxNum: Int = nums.max()!
    let digits = String(maxNum).count
    var sorted: [Int] = nums
    for digit in 0..<digits {
        sorted = countingSortByDigit(nums: sorted, digit: digit)
        print(sorted)
    }
    return sorted
}

print(radixSort(nums: [391, 582, 50, 924, 8, 192]))
