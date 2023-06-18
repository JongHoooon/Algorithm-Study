import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    let discountRates: [Int] = [10, 20, 30, 40]
    var answerPlusCount: Int = 0
    var answerSaleCount: Int = 0
    
    
    func countSales(_ rates: [Int]) { 
        let prices: [Int] = []
        
        var plusCount: Int = 0
        var saleCount: Int = 0
        
        for user in users { 
            var sum: Int = 0
            for (i, r) in rates.enumerated() { 
                // 🚨부동 소수점 오차 조심🚨
                if r >= user[0] { sum += Int(Double(100-r)*Double(emoticons[i])*0.01) }
            }
            if sum >= user[1] { 
                plusCount += 1
            } else { 
                saleCount += sum
            }
        }
        
        if plusCount > answerPlusCount { 
            answerPlusCount = plusCount
            answerSaleCount = saleCount
        } else if plusCount == answerPlusCount && saleCount > answerSaleCount { 
            answerSaleCount = saleCount
        }
    }
    
    func bfs(_ rates: [Int]) { 
        
        if rates.count == emoticons.count { 
            countSales(rates)
            return 
        }
        
        for i in discountRates.indices { 
            let rate = discountRates[i]
            bfs(rates + [rate])
        }
    }
    
    bfs([])
    
    return [answerPlusCount, answerSaleCount]
}
