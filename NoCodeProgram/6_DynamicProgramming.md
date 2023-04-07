# Dynamic Programming


1. Problem이 subproblem으로 쪼개질 때
2. subproble의 솔루션으로 더 큰 problem의 솔루션을 구할 수 있을때
3. subproble들이 겹칠 때
   
<br>

- memoization을 사용해 겹치는 부분을 기억한다.
- Top-Down: 재귀
- Bottom-Up: 작은 부분부터 

<br>


## Min Cost Climbing Stairs 
[LeetCode 746. Min Cost Climbing Stairs](https://leetcode.com/problems/min-cost-climbing-stairs/description/)
- 이전 단계라는 subproblem으로 나눠서 생각한다.

```swift
func minCostClimbingStairs(_ cost: [Int]) -> Int {

    let totalCount: Int = cost.count
    var minCost: [Int] = Array(repeating: 0, count: totalCount+1)

    for i in 2...totalCount {
        let oneStep: Int = minCost[i-1] + cost[i-1]
        let twoStep: Int = minCost[i-2] + cost[i-2]
        minCost[i] = min(oneStep, twoStep)
    }
    return minCost[totalCount]
}
```

<br>

## Minimum Path Sum
[LeetCode 64. Minimum Path Sum](https://leetcode.com/problems/minimum-path-sum/)
- 이전 단계중 최소 비용을 선택

```swift
func minPathSum(_ grid: [[Int]]) -> Int {
    let rows: Int = grid.count
    let cols: Int =  grid[0].count
    var minCost2d: [[Int]] = Array(
        repeating: Array(repeating: 0, count: cols), 
        count: rows
    )

    minCost2d[0][0] = grid[0][0]
    for colIdx in 1..<cols { 
        minCost2d[0][colIdx] = grid[0][colIdx] + minCost2d[0][colIdx-1]
    }
    for rowIdx in 1..<rows { 
        minCost2d[rowIdx][0] = grid[rowIdx][0] + minCost2d[rowIdx-1][0]
    }
    
    for rowIdx in 1..<rows { 
        for colIdx in 1..<cols { 
            let preRow = rowIdx - 1
            let preCol = colIdx - 1
            let cost = min(
                minCost2d[preRow][colIdx],
                minCost2d[rowIdx][preCol]
            )
            minCost2d[rowIdx][colIdx] = cost + grid[rowIdx][colIdx]
        }
    }

    return minCost2d[rows-1][cols-1]
}
```

<br>

## 동전 바꾸기
[LeetCode 322. Coin Change](https://leetcode.com/problems/coin-change/)

- F(n) = Min(F(n-2), F(n-3), F(n-5) + 1
- bottom up 방식 선호
- TC: O(K*n), (k: 동전 개수)

```swift
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
```

## Decoding Ways

- 몇가지 방법? -> DP
  - sub problem으로 나눠 본다.

  <img src = "/NoCodeProgram/images/ncp_dp_1.jpeg" width = "50%">