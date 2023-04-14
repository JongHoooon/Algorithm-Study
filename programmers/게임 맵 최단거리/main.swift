//
//  main.swift
//  게임 맵 최단거리
//
//  Created by JongHoon on 2023/04/15.
//

import Foundation

func solution(_ maps: [[Int]]) -> Int {
    
    var distances: [[Int]] = Array(
        repeating: Array(repeating: 0, count: maps[0].count),
        count: maps.count
    )
    let dx: [Int] = [-1, 1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    var result: Int = -1
    
    func bfs(_ x: Int, _ y: Int) {
        distances[x][y] = 1
        var queue: [(Int, Int)] = [(x, y)]
        
        while !queue.isEmpty {
            
            let crnt = queue.removeFirst()
            let crntDistance: Int = distances[crnt.0][crnt.1]
            for i in dx.indices {
                let nx = crnt.0 + dx[i]
                let ny = crnt.1 + dy[i]
                
                if !(0..<maps.count ~= nx) || !(0..<maps[0].count ~= ny) {
                    continue
                }
                if distances[nx][ny] != 0 {
                    continue
                }
                if maps[nx][ny] == 0 {
                    continue
                }
                
                distances[nx][ny] = crntDistance + 1
                queue.append((nx, ny))
                if nx == maps.count-1 && ny == maps[0].count-1 {
                    result = distances[nx][ny]
                    return
                }
            }
        }
    }
    bfs(0, 0)
    print(distances)
    
    return result
}

print(solution([[1,0,1,1,1],[1,0,1,0,1],[1,0,1,1,1],[1,1,1,0,1],[0,0,0,0,1]]))
print(solution([[1,0,1,1,1],[1,0,1,0,1],[1,0,1,1,1],[1,1,1,0,0],[0,0,0,0,1]]))
