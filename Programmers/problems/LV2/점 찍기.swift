import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    
    var count: Int64 = 0
    
    for i in 0...d/k { 
        let x = i*k
        count += Int64(Double(d*d - x*x).squareRoot()) / Int64(k) + 1
    }
    
    return count
}