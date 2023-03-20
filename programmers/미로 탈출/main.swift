//
//  main.swift
//  미로 탈출
//
//  Created by JongHoon on 2023/03/05.
//

//import Foundation

func solution(_ maps:[String]) -> Int {
    let countOfLows: Int = maps.count
    let countOfColumns: Int = maps[0].count
    let dx: [Int] = [-1, 1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    var start: (Int, Int) = (0, 0)
    var exit: (Int, Int) = (0, 0)
    var lever: (Int, Int) = (0, 0)
    var arrOfMap: [[Character]] = []
    
    for (i, low) in maps.enumerated() {
        let low = Array(low)
        
        if let j = low.firstIndex(of: "S") {
            start = (i, j)
        }
        if let j = low.firstIndex(of: "E") {
            exit = (i, j)
        }
        if let j = low.firstIndex(of: "L") {
            lever = (i, j)
        }
        arrOfMap.append(low)
    }
    
    func bfs(start: (Int, Int), end: (Int, Int)) -> Int {
        var distances: [[Int]] = Array(
            repeating: Array(repeating: -1, count: countOfColumns),
            count: countOfLows
        )
        var queue: [(Int, Int)] = [start]
        distances[start.0][start.1] = 0
        
        while !queue.isEmpty {
            
            let currentLocation = queue.removeFirst()
            for i in dx.indices {
                let nx = currentLocation.0 + dx[i]
                let ny = currentLocation.1 + dy[i]
                guard 0..<countOfLows ~= nx && 0..<countOfColumns ~= ny &&
                        arrOfMap[nx][ny] != "X" && distances[nx][ny] == -1 else { continue }
                
                distances[nx][ny] = distances[currentLocation.0][currentLocation.1] + 1
                queue.append((nx, ny))
                
                if (nx, ny) == end {
                    return distances[nx][ny]
                }
            }
        }
        return -1
    }
    
    let distanceSToL: Int = bfs(start: start, end: lever)
    let distanceLToE: Int = bfs(start: lever, end: exit)
    
    return distanceSToL == -1 || distanceLToE == -1 ? -1 : distanceSToL + distanceLToE
}


print(solution(["SOOOL","XXXXO","OOOOO","OXXXX","OOOOE"]))

print(solution(["LOOXS","OOOOX","OOOOO","OOOOO","EOOOO"]))














/*
func solution(_ maps:[String]) -> Int {
    
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    var start: (Int, Int) = (0, 0)
    var lever: (Int, Int) = (0, 0)
    var mapArr: [[Character]] = []
    
    
    for (i, low) in maps.enumerated() {
        if let j = Array(low).firstIndex(of: "S") {
            start = (j, i)
        }
        if let j = Array(low).firstIndex(of: "L") {
            lever = (j, i)
        }
        mapArr.append(Array(low))
    }
    
    func bfs(start: (Int, Int), end: String) -> Int? {
        var distance: [[Int]] = Array(repeating: [Int](repeating: -1, count: maps[0].count),
                                      count: maps.count)
        var queue: [(Int, Int)] = []
        distance[start.1][start.0] = 0
        queue.append(start)
        
        while !queue.isEmpty {
            let (qx, qy) = queue.removeFirst()
            for i in 0..<4 {
                let nx = qx + dx[i]
                let ny = qy + dy[i]
                if 0..<maps[0].count ~= nx && 0..<maps.count ~= ny &&
                    mapArr[ny][nx] != "X" && distance[ny][nx] == -1 {
                    if mapArr[ny][nx] == Character(end) {
                        return distance[qy][qx] + 1
                    }
                    distance[ny][nx] = distance[qy][qx] + 1
                    queue.append((nx, ny))
                }
            }
        }
        return nil
    }
    
    guard let time1 = bfs(start: start, end: "L") else { return -1 }
    guard let time2 = bfs(start: lever, end: "E") else { return -1 }
    
    return time1 + time2
}


print(solution(["SOOOL","XXXXO","OOOOO","OXXXX","OOOOE"]))
 */


//print(solution(["LOOXS","OOOOX","OOOOO","OOOOO","EOOOO"]))


/*
 
 
 now: 0, 4
 
 now: 0, 3
 now: 1, 4
 
 now: 0, 2
 
 now: 2, 4
 
 now: 1, 2
 now: 3, 4
 
 
 */
