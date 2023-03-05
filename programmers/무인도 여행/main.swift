//
//  main.swift
//  무인도 여행
//
//  Created by JongHoon on 2023/03/05.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {
    let rows = maps.count
    let cols = maps[0].count
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var visited: [[Bool]] = Array(repeating: [Bool](repeating: false, count: cols), count: rows)
    let graph = maps.reduce(into: [[Character]](), {
        $0.append(Array($1))
    })
    print(graph)
    
    func dfs(x: Int, y: Int) -> Int {
        visited[x][y] = true
        var sum: Int = Int(String(graph[x][y]))!
        
        for i in dx.indices {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0..<rows ~= nx && 0..<cols ~= ny &&
                !visited[nx][ny] && graph[nx][ny] != "X" {
                sum += dfs(x: nx, y: ny)
            }
        }
        return sum
    }
    
    func bfs(x: Int, y: Int) -> Int {
        visited[x][y] = true
        var queue: [(Int, Int)] = [(x, y)]
        var sum = 0
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            sum += Int(String(graph[x][y]))!
            for i in dx.indices {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0..<rows ~= nx && 0..<cols ~= ny &&
                    graph[nx][ny] != "X" && !visited[nx][ny] {
                    queue.append((nx, ny))
                    visited[nx][ny] = true
                }
            }
        }
        return sum
    }
    
    /*
    // DFS
    var result = [Int]()
    for i in 0..<rows {
        for j in 0..<cols {
            if visited[i][j] || graph[i][j] == "X" { continue }
            result.append(dfs(x: i, y: j))
        }
    }
    */
    
    //BFS
    var result = [Int]()
    for i in 0..<rows {
        for j in 0..<cols {
            if visited[i][j] || graph[i][j] == "X" { continue }
            result.append(bfs(x: i, y: j))
        }
    }
    
    return result.isEmpty ? [-1] : result.sorted()
}


print(solution(["X591X","X1X5X","X231X", "1XXX1"]))
