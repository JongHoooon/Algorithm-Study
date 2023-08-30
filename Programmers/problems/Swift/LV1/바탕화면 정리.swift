import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    let wallpaper: [[Character]] = wallpaper.map { Array($0) }
    
    var lux = Int.max
    var luy = Int.max
    var rdx = Int.min
    var rdy = Int.min
    
    for i in 0..<wallpaper.count { 
        for j in 0..<wallpaper[0].count { 
            guard wallpaper[i][j] != "." else { continue }
            lux = min(lux, i)
            luy = min(luy, j)
            rdx = max(rdx, i+1)
            rdy = max(rdy, j+1)
        }
    }
    
    return [lux, luy, rdx, rdy]
}