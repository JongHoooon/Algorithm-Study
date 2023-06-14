//
//  main.swift
//  practice
//
//  Created by JongHoon on 2023/06/05.
//

//func solution(_ n:Int) -> [[Int]] {
//
//    var answer: [[Int]] = Array(
//        repeating: Array(repeating: 0, count: n),
//        count: n
//    )
//
//    for i in 0..<n {
//        answer[0][i] = i + 1
//    }
//
//    var x: Int = 0
//    var y: Int = n-1
//    var m: Int = 1
//
//    for count in (1..<n).reversed() {
//
//        for _ in 0..<count {
//            let current = answer[x][y]
//            x += 1 * m
//            answer[x][y] = current + 1
//        }
//
//        for _ in 0..<count {
//            let current = answer[x][y]
//            y -= 1 * m
//            answer[x][y] = current + 1
//        }
//        m = m * -1
//    }
//
//    return answer
//}
//
//
//print(solution(5))


print("New" == "new")
