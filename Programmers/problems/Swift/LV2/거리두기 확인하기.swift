import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    let dx1: [Int] = [-1, 1, 0, 0]
    let dy1: [Int] = [0, 0, -1, 1]
    
    let dx2: [Int] = [-1, -1, 1, 1]
    let dy2: [Int] = [-1, 1, -1, 1]
            
    func checkPlace(_ place: [String]) -> Bool {
        let place: [[Character]] = place.map { Array($0) }
        
        for x in 0..<5 {
            for y in 0..<5 {
                guard place[x][y] == "P" else { continue }
                
                // 맨하튼 거리1인 경우
                for i in dx1.indices { 
                    let nx = x + dx1[i]
                    let ny = y + dy1[i]
                    
                    guard 0..<5 ~= nx && 0..<5 ~= ny else { continue }
                    if place[nx][ny] == "P" { 
                        return false
                    }
                }
                
                // 맨하튼 거리2인 경우(대각으로)
                for i in dx1.indices { 
                    let checkX = x + dx1[i]
                    let checkY = y + dy1[i]
                    let nx = x + dx1[i]*2
                    let ny = y + dy1[i]*2
                    
                    guard 0..<5 ~= nx && 0..<5 ~= ny else { continue }
                    
                    if place[nx][ny] == "P" && place[checkX][checkY] != "X" { 
                        return false
                    }
                }
                
                // 맨하튼 거리2인 경우(직선으로)
                for i in dx2.indices { 
                    let nx = x + dx2[i]
                    let ny = y + dy2[i]
                    
                    guard 0..<5 ~= nx && 0..<5 ~= ny else { continue }
                    
                    if place[nx][ny] == "P" && !(place[x+dx2[i]][y] == "X" && place[x][y+dy2[i]] == "X") { 
                        return false
                    }
                }
            }
        }
            
        return true
    }
    
    var answer: [Int] = []
    for place in places { 
        let check: Int = checkPlace(place) == true ? 1 : 0
        answer.append(check)
    }
    
    return answer
}