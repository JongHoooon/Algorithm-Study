//
//  main.swift
//  이모티콘 할인행사
//
//  Created by JongHoon on 2023/03/06.
//

import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var finalSaleCount: Int = -1
    var finalEmoticonPlusCount: Int = -1
    let dicountRates: [Int] = [10, 20, 30, 40]
    let users = users.sorted(by: { $0[0] > $1[0] })
    
    // 할인율 조합 dfs
    func dfs(arr: [Int], discountRates: [Int]) {
        
        // 할인율 조합의 count == 이모티콘의 count
        if arr.count == emoticons.count {
            // 할인율 조합으로 판매금액, plus 수 계산해서 업데이트
            countWithRates(with: arr)
            return
        }
        
        for r in discountRates {
            dfs(arr: arr + [r], discountRates: discountRates)
        }
    }
    
    func countWithRates(with arr: [Int]) {
        var saleCount: Int = 0
        var emoticonPlusCount: Int = 0
 
        for u in users {
            var sum: Int = 0
            for (i, r) in arr.enumerated() {
                if u[0] <= r {
                    sum += Int(Double(emoticons[i]) * Double(100 - r) * 0.01)
//                    sum += Int(Double(emoticons[i]) * (Double(100 - r) / 100))
                }
            }
            
            if sum >= u[1] {
                emoticonPlusCount += 1
            } else {
                saleCount += sum
            }
        }
        
        if emoticonPlusCount > finalEmoticonPlusCount {
            finalEmoticonPlusCount = emoticonPlusCount
            finalSaleCount = saleCount
        } else if emoticonPlusCount == finalEmoticonPlusCount {
            finalSaleCount = finalSaleCount > saleCount ? finalSaleCount : saleCount
        }
    }
    
    dfs(arr: [], discountRates: dicountRates.filter { $0 >= users.last![0] })
    
    return [finalEmoticonPlusCount, finalSaleCount]
}


print(solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]], [1300, 1500, 1600, 4900]))

/*
 할인률 10, 20, 30, 40

10:
20:
30:
40:
 */

/*
40, 25
 
10:
20:
30: (25, 10000)
40: (25, 10000), (40, 10000)
 
7000
9000
*/


/*
 40 23 11 5 40 27 32
 0 : (5, 5900)
 10: (5, 5900)
 20: (5, 5900), (11, 5200)
 30: (5, 5900), (11, 5200), (23, 10000), (27, 9200)
 40: (5, 5900), (11, 5200), (23, 10000), (27, 9200), (32, 6900), (40, 2900), (40, 3100)

 1300
 1500
 1600
 4900
 */


