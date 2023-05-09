//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by JongHoon on 2023/01/21.
//

 
import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    
    let users: [[Int]] = users.sorted(by: { $0[0] < $1[0] })
    let discountRates: [Int] = [10, 20, 30, 40].filter { $0 >= users[0][0] }

    
    var answerUsers: Int = 0
    var answerSales: Int = 0
    
    func dfs(_ rates: [Int]) {
        
        if rates.count == emoticons.count {
            // count()
            return
        }
        
        for r in discountRates {
            dfs(rates + [r])
        }
    }
    
    func count(_ rates: [Int]) {
        var plusUsers: Int = -1
        var sales: Int = -1
        
        for u in users {
            
        }
        
    }
    
    
    
    
    return []
}
//
//import Foundation
//
//func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
//    var finalSaleCount: Int = -1
//    var finalEmoticonPlusCount: Int = -1
//    let dicountRates: [Int] = [10, 20, 30, 40]
//    let users = users.sorted(by: { $0[0] > $1[0] })
//
//    // 할인율 조합 dfs
//    func dfs(arr: [Int], discountRates: [Int]) {
//
//        // 할인율 조합의 count == 이모티콘의 count
//        if arr.count == emoticons.count {
//            // 할인율 조합으로 판매금액, plus 수 계산해서 업데이트
//            countWithRates(with: arr)
//            return
//        }
//
//        for r in discountRates {
//            dfs(arr: arr + [r], discountRates: discountRates)
//        }
//    }
//
//    func countWithRates(with arr: [Int]) {
//        var saleCount: Int = 0
//        var emoticonPlusCount: Int = 0
//
//        for u in users {
//            var sum: Int = 0
//            for (i, r) in arr.enumerated() {
//                if u[0] <= r {
//                    sum += Int(Double(emoticons[i]) * Double(100 - r) * 0.01)
//                }
//            }
//
//            if sum >= u[1] {
//                emoticonPlusCount += 1
//            } else {
//                saleCount += sum
//            }
//        }
//
//        if emoticonPlusCount > finalEmoticonPlusCount {
//            finalEmoticonPlusCount = emoticonPlusCount
//            finalSaleCount = saleCount
//        } else if emoticonPlusCount == finalEmoticonPlusCount {
//            finalSaleCount = finalSaleCount > saleCount ? finalSaleCount : saleCount
//        }
//    }
//
//    dfs(arr: [], discountRates: dicountRates.filter { $0 >= users.last![0] })
//
//    return [finalEmoticonPlusCount, finalSaleCount]
//}
