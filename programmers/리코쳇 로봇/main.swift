//
//  main.swift
//  리코쳇 로봇
//
//  Created by JongHoon on 2023/03/19.
//

import Foundation

func solution(_ board:[String]) -> Int {
    
    let board: [[Character]] = board.map { Array($0) }
    var isVisited: [[Int]] = Array(
        repeating: Array(
            repeating: -1, count: board[0].count),
            count: board.count
        )
        
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var start: (Int, Int) = (-1, -1)
    
loop1: for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] == "R" {
                start = (i, j)
                break loop1
            }
        }
    }
        
    func bfs(_ start: (Int, Int)) -> Int {
        
        var queue: [(Int, Int)] = [start]
        isVisited[start.0][start.1] = 0
        
        while !queue.isEmpty {
            
            let current = queue.removeFirst()
            
            if board[current.0][current.1] == "G" {
                return isVisited[current.0][current.1]
            }
            
            for i in 0..<dx.count {
                
                var nx = current.0
                var ny = current.1
                
                while 0..<board.count ~= nx + dx[i] &&
                        0..<board[0].count ~= ny + dy[i] &&
                        board[nx + dx[i]][ny + dy[i]] != "D" {
                    
                    nx += dx[i]
                    ny += dy[i]
                }
                
                guard nx != current.0 || ny != current.1 else { continue }
                guard isVisited[nx][ny] == -1 else { continue }
                
                isVisited[nx][ny] = isVisited[current.0][current.1] + 1
                queue.append((nx, ny))
            }
        }
        return -1
    }
    return bfs(start)
}


print(solution(["...D..R", ".D.G...", "....D.D", "D....D.", "..D...."]))

