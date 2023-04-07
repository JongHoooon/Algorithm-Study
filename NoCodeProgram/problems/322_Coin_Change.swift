func coinChange(_ coins: [Int], _ amount: Int) -> Int {

    var dp = Array(repeating: -1, count: amount + 1)
    dp[0] = 0

    for i in 0...amount { 
        if dp[i] != -1 { continue }

        var countMin: Int = Int.max
        for coin in coins { 
            let lastIdx = i - coin
            if lastIdx < 0 { continue }

            let lastCost = dp[lastIdx]
            if lastCost == -1 { continue }

            let cost = lastCost + 1
            countMin = min(cost, countMin)
        }
        dp[i] = countMin == Int.max ? -1 : countMin
    }
    
    return dp[amount]
}


print(coinChange([1], 0))