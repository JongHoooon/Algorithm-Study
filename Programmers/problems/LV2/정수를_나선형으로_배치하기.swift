import Foundation

func solution(_ n:Int) -> [[Int]] {
    var answer: [[Int]] = Array(
        repeating: Array(repeating: 0, count: n),
        count: n
    )
    
    for i in 0..<n {
        answer[0][i] = i + 1
    }
    
    var x: Int = 0
    var y: Int = n-1
    var m: Int = 1
    
    for count in (1..<n).reversed() {
        
        for _ in 0..<count {
            let current = answer[x][y]
            x += 1 * m
            answer[x][y] = current + 1
        }
        
        for _ in 0..<count {
            let current = answer[x][y]
            y -= 1 * m
            answer[x][y] = current + 1
        }
        m = m * -1
    }
    
    return answer
}

func solution2(_ n:Int) -> [[Int]] {
    var dx = [0, 1, 0, -1]
    var dy = [1, 0, -1, 0]
    var x = 0
    var y = 0
    var dir = 0

    for i in 1...n*n {
        answer[x][y] = i
        let nx = x + dx[dir]
        let ny = y + dy[dir]

        guard nx >= 0 && ny >= 0
    }

    return []
}
