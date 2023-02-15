import Foundation

//func solution(_ maps: [String]) -> [Int] {
//    let graph = maps.reduce(into: [[Character]]()) { result, map in
//        result.append(Array(map))
//    }
//    let row = graph.count
//    let col = graph[0].count
//    let dx = [0, 0, 1, -1]  // 상 하 좌 우
//    let dy = [-1, 1, 0, 0]
//    var visit = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
//
//    func dfs(_ x: Int, _ y: Int) -> Int {
//        if graph[x][y] == "X" { return 0 }
//        var sum = Int(graph[x][y].asciiValue!) - 48
//        visit[x][y] = true
//        for i in dx.indices {
//            let nx = x + dx[i]
//            let ny = y + dy[i]
//            if nx >= row || nx < 0 || ny >= col || ny < 0 { continue }
//            if visit[nx][ny] { continue }
//            visit[nx][ny] = true
//            sum += dfs(nx, ny)
//        }
//        return sum
//    }
//
//    var ans: [Int] = []
//    for i in 0..<row {
//        for j in 0..<col {
//            if visit[i][j] || graph[i][j] == "X" { continue }
//            let sum = dfs(i, j)
//            if sum > 0 {
//                ans.append(sum)
//            }
//        }
//    }
//
//    return ans.isEmpty ? [-1] : ans.sorted()
//}
//
//
//
//
//
//print(solution(["X591X","X1X5X","X231X", "1XXX1"]))


//func solution(_ s:String) -> String {
//    var words = s.lowercased().components(separatedBy: " ").map { Array($0) }
//    
//    for i in words.indices {
//        if words[i][0].is {
//            words[i][0] = words[i][0].uppercased()
//        }
//    }
//    print(words)
//    
//    print(words)
//    
//    return ""
//}

let arr = [1, 2, 3, 4]

