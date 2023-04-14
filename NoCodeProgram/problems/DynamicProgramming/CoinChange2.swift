
func coinChange(amount: Int, coins: [Int]) -> Int {

    var dp: [[Int]] = Array(
        repeating: Array(repeating: 0, count: amount+1), 
        count: coins.count+1
    )

    for i in dp.indices { 
        dp[i][0] = 1 
    }

    for rowIdx in 1..<coins.count+1 {
        for colIdx in 1..<amount+1 {
            let prevRowIdx: Int = rowIdx - 1
            let coin: Int = colIdx - coins[rowIdx-1] 
            var sum: Int = dp[prevRowIdx][colIdx]
            if coin >= 0 { 
                sum += dp[rowIdx][coin]
            }
            dp[rowIdx][colIdx] = sum
        }
    }

    print(dp)

    return dp[coins.count][amount]
}

print(coinChange(amount: 5, coins: [1,2,3]))