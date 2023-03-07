//
//  main.swift
//  유사 칸토어 비트열
//
//  Created by JongHoon on 2023/03/07.
//

import Foundation


// 시간 초과
//func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
//    let l: Int = Int(l) - 1
//    let r: Int = Int(r) - 1
//
//    func cantor(n: Int) -> String {
//        if n == 0 { return "1" }
//        var dp: [String] = ["1"]
//        for i in 0..<n {
//            var arr: String = ""
//            for c in Array(dp[i]) {
//                if c == "1" {
//                    arr.append("11011")
//                } else {
//                    arr.append("00000")
//                }
//            }
//            dp.append(arr)
//        }
//        print(dp)
//        return dp[n]
//    }
//
//    return Array(cantor(n: n))[l...r]
//        .filter { $0 == "1" }
//        .count
//}
 

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    let l: Int = Int(l)
    let r: Int = Int(r)
    let arr: [Int] = [1, 1, 0, 1, 1]

    func countOne(_ boundary: Int) -> Int {
        if boundary <= 5 { return arr[0..<boundary].reduce(0, +) }
        
        var base = 1
        while Int(pow(Double(5), Double(base+1))) < boundary {
            base += 1
        }
        
        let section = boundary / Int(pow(Double(5), Double(base)))
        let remainder = boundary % Int(pow(Double(5), Double(base)))
        
        var answer = section * Int(pow(Double(4), Double(base)))
        
        if section >= 3 {
            answer -= Int(pow(Double(4), Double(base)))
        }
        
        if section == 2 {
            return answer
        } else {
            return answer + countOne(remainder)
        }
    }

    return countOne(r) - countOne(l-1)
}

// 16 + 2, 32 + 8 + 2

//print(solution(2, 4, 17))   // 8
//print(solution(4, 30, 118)) // 39
//print(solution(3, 1, 125)) // 64
print(solution(4, 27, 68)) // 15
//print(solution(4, 4, 126))
//print(solution(1, 1, 5))

// 16 + 1, 32 + 8 + 2

/*
n = 1
1 / 1 / 0 / 1 / 1 - 1

n = 2
4 / 4 / 0 / 4 / 4 - 2  1 1 4 4  1 1    -> 11     / 4+4+0+2
5    5   5    5   5
 
n = 3
16 / 16 / 0 / 16 / 16 - 3
25  25    25   25   25
 
n = 4
64 / 64 / 0 / 64 / 64 - 4
125
*/
// 29, 100 8 2

/*
 
 
 
 1101111011
 0000011011
 11011 - 16
 
 11011 - 16
 1101100000
 1101111011
 
 0000000000
 00000000
 
 0000011011
 1101100000
 1101111011
 1101111011
 0000011011
 1101111011
 110110000011011110111101111011000001101111011000000000000000000000000011011110110000011011110111101111011000001101111011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001101111011000001101111011110111101100000110111101100000000000000000000000001101111011000001101111011110111101100000110111101111011110110000011011110111101111011000001101111011000000000000000000000000011011110110000011011110111101111011000001101111011
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */
