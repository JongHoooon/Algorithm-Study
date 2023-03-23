//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by JongHoon on 2023/01/21.
//

import Foundation

let NM = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N: Int = NM[0]
let M: Int = NM[1]
var coins: [Int] = Array(repeating: 0, count: N)
var dp: [Int] = Array(repeating: -1, count: 1000)
for i in 0..<N {
    coins[i] = Int(readLine()!)!
    dp[coins[i]] = 1
}

for i in (coins.max()!+1)..<M+1 {
    var nexts: [Int] = []
    for c in coins {
        if i-c > 0 && dp[i-c] != -1 { nexts.append(dp[i-c]) }
    }
    dp[i] = nexts.isEmpty ? -1 : nexts.min()!+1
}

print(dp)
print(dp[M])

