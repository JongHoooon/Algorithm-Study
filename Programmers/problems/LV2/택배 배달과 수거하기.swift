import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
 
    var deliveries = deliveries
    var pickups = pickups
    var answer: Int = 0
        
    while !deliveries.isEmpty || !pickups.isEmpty {
        
        deliveries.trimZeroSuffix()
        pickups.trimZeroSuffix()
        
        let distance = max(deliveries.count, pickups.count)
        answer += distance * 2
        
        var load = 0
        while !deliveries.isEmpty && load < cap { 
            if load + deliveries.last! <= cap { 
                load += deliveries.removeLast()
            } else { 
                deliveries[deliveries.count-1] = deliveries.last! - (cap - load)
                load += cap - load
            }
        }
        
        load = 0
        while !pickups.isEmpty && load < cap { 
            if load + pickups.last! <= cap { 
                load += pickups.removeLast()
            } else {
                pickups[pickups.count-1] = pickups.last! - (cap - load)
                load += cap - load
            }
        }
    }
    
    return Int64(answer)
}

extension Array where Element == Int { 
    mutating func trimZeroSuffix() {
        while self.last == 0 { 
            _ = self.popLast()
        }
    }
}


/*-----------------------------------------------------------------------------------*/


func solution2(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var answer = 0
    var deliver = 0
    var pickup = 0

    for idx in stride(from: n-1, through: 0, by: -1) {
        deliver += deliveries[idx]
        pickup += pickups[idx]

        while deliver > 0 || pickup > 0 { 
            deliver -= cap
            pickup -= cap
            answer += (idx + 1) * 2
        }
    }

    return Int64(answer)
}