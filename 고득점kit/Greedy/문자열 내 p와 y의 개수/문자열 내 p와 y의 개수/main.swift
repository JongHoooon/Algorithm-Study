//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by JongHoon on 2023/01/21.
//

import Foundation


//let NM: [Int] = readLine()!
//    .split(separator: " ")
//    .map { Int($0)! }
//
//let N: Int = NM[0]
//let M: Int = NM[1]
//let dx: [Int] = [1, -1, 0, 0]
//let dy: [Int] = [0, 0, -1, 1]
//var graph: [[Int]] = []
//var isVisited: [[Bool]] = Array(
//    repeating: Array(repeating: false, count: M),
//    count: N
//)
//
//for _ in 0..<N {
//    let input: [Int] = Array(readLine()!)
//        .map { Int(String($0))! }
//
//    graph.append(input)
//}
//
//func dfs(x: Int, y: Int) {
//    isVisited[x][y] = true
//
//    for i in dx.indices {
//        let nx: Int = x + dx[i]
//        let ny: Int = y + dy[i]
//        guard 0..<N ~= nx && 0..<M ~= ny &&
//                graph[nx][ny] == 0 &&
//                !isVisited[nx][ny] else { continue }
//        dfs(x: nx, y: ny)
//    }
//}
//
//var count: Int = 0
//for i in 0..<N {
//    for j in 0..<M {
//        if isVisited[i][j] || graph[i][j] == 1 { continue }
//        dfs(x: i, y: j)
//        count += 1
//    }
//}
//
//print(count)
