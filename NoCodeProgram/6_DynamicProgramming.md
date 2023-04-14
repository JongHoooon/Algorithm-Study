# Dynamic Programming

1. Problem이 subproblem으로 쪼개질 때
2. subproblem의 솔루션으로 더 큰 problem의 솔루션을 구할 수 있을때
3. subproblem들이 겹칠 때

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

[LeetCode 91. Decode Ways](https://leetcode.com/problems/decode-ways/)

- 몇가지 방법? -> DP
  - sub problem으로 나눠 본다.
    - topdown
    
      <img src = "/NoCodeProgram/images/ncp_dp_1.jpeg" width = "50%">

    - bottomup
      뒤에서부터 확인

<br>

```swift
func numDecodings(_ s: String) -> Int {
    let chars: [Character] = Array(s)
    let strCount: Int = s.count
    if strCount == 0 { return 0 }

    var dp: [Int] = Array(repeating: -1, count: strCount+1)
    dp[strCount] = 1

    let lastChar: Character = chars[chars.count-1]
    if Int(String(lastChar))! == 0 { 
        dp[strCount-1] = 0
    } else { 
        dp[strCount-1] = 1
    }

    for i in stride(from: strCount-2, through: 0, by: -1) { 
        let singleNum: Int = Int(String(chars[i]))!
        let singleCount: Int = 0 < singleNum ? dp[i+1] : 0

        let doubleNum: Int = Int(String(chars[i+1]))! + singleNum * 10
        let doubleCount: Int = 10...26 ~= doubleNum ? dp[i+2] : 0

        dp[i] = singleCount + doubleCount
    }

    return dp[0]
} 
```

<br>

## Max SubArray Sum

[LeetCode 53. Decode Ways](https://leetcode.com/problems/maximum-subarray/)

- max subarray with last element로 생각
- F(n) = max(In(n), In(n)+F(n-1))
  - 마지막, 마지막 + 이전 상황

<br>

```swift
func maxSubArray(_ nums: [Int]) -> Int {
    var dp: [Int] = Array(repeating: -1, count: nums.count)
    dp[0] = nums[0]

    for i in 1..<nums.count { 
        dp[i] = max(nums[i], nums[i]+dp[i-1])
    }

    return dp.max() ?? -1
}
```

<br>

## 최대 곱 subArray

[LeetCode 152.Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/)

<br>

```swift
func maxProduct(_ nums: [Int]) -> Int {
  
    var maxDP: [Int] = [nums[0]]
    var minDP: [Int] = [nums[0]]

    for idx in 1..<nums.count { 
        let prevIdx = idx - 1

        let num: Int = nums[idx]
        let cand0: Int = num
        let cand1: Int = maxDP[prevIdx]*num
        let cand2: Int = minDP[prevIdx]*num

        maxDP.append(max(cand0, cand1, cand2))
        minDP.append(min(cand0, cand1, cand2))
    }
    return maxDP.max() ?? -1
}
```

<br>

## 최대 길이 Palindrome Substring

- 2차원 dp

```swift
func longestPalindrome(s: String) -> String {
    let strCount: Int = s.count
    let chars: [Character] = Array(s)
    var dp: [[Int]] = Array(
        repeating: Array(repeating: 0, count: strCount),
        count: strCount
    )

    for i in 0..<strCount { 
        dp[i][i] = 1
    }

    for i in 1..<strCount-1 { 
        dp[i][i+1] = 2
    }

    for i in 2..<strCount { 
        var row: Int = 0
        var col: Int = i
        while col < strCount { 
            let startChar: Character = chars[row]
            let endChar: Character =  chars[col]
            let prevCount: Int = dp[row+1][col-1]
            if startChar == endChar && prevCount != 0 { 
                dp[row][col] = prevCount + 2
            }
            row += 1
            col += 1
        }
    }

    var maxLength = 0 
    var startIdx = 0
    var endIdx = 0
    for row in 0..<strCount {
        for col in 0..<strCount { 
            let currentLength: Int = dp[row][col]
            if maxLength < currentLength {
                maxLength = currentLength
                startIdx = row
                endIdx = col
            }
        }
    }

    let subStr: String = String(chars[startIdx...endIdx])
    return subStr
}

print(longestPalindrome(s: "baabc"))
```

[LeetCode 647. Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/description/)

```swift
func countSubstrings(_ s: String) -> Int {
    let s = Array(s)

    var dp = Array(
        repeatElement(Array(repeatElement(false, count: s.count)), 
        count: s.count)
    )
    var count = 0

    for i in 0..<s.count {
        dp[i][i] = true
        count += 1
    }

    for r in 1..<s.count { 
        for l in 0..<r { 
            if s[r] == s[l] && (dp[l+1][r-1] || r - l <= 2) { 
                dp[l][r] = true
                count += 1
            }
        }
    }

    return count
}
```

<br>

## 단어 자르기

```swift
func wordBreak(s: String, wordDict: [String]) -> Bool { 
    let chars: [Character] = Array(s)
    let wordSet: Set<String> = Set(wordDict)

    let strCount: Int = s.count
    var dp: [Bool] = Array(repeating: false, count: strCount)
    dp[0] = true

    for idx in 1..<strCount { 
        for word in wordSet { 
            let wordLength: Int = word.count
            let prevIdx: Int = idx - wordLength
          
            if prevIdx < 0 { continue }
            if !dp[prevIdx] { 

                continue 
            }

            if String(chars[prevIdx..<idx]) == word {
                dp[idx] = true
                break
            }
        }
    }
    return dp.last!
}
```

<br>

## knapsack problem

- 배낭안에 있는 경우 없는 경우로 subproblem 정의
- NS(n, w) = max(NS(n-1, w), NS(n-1, w-w[n])+val[n]), (n - 몇번째물건까지, w - 무게 리밋)
  - 2개의 변수 -> 2차원 dp
- TC: O(nw)
- SC: O(nw)

<img src = "/NoCodeProgram/images/ncp_dp_2.jpeg" width = "50%">

|      | 0 | 1  | 2  | 3  | 4  | 5  |
| ---- | - | -- | -- | -- | -- | -- |
|      | 0 | 0  | 0  | 0  | 0  | 0  |
| A    | 0 | 30 | 30 | 30 | 30 | 30 |
| AB   | 0 | 30 | 30 | 50 | 50 | 50 |
| ABC  | 0 | 30 | 30 | 50 | 70 | 70 |
| ABCD | 0 | 30 | 30 | 50 | 70 | 70 |

<br>

## Partition Equal Subset Sum

[LeetCode 416.Partition Equal Subset Sum](https://leetcode.com/problems/partition-equal-subset-sum/)

- (총합 / 2) subset 있는지 확인
- knapsack problem 처럼 있는 경우 없는 경우로 나누어 생각한다.
- DP(n, s) = DP(n-1, s) || DP(n-1, s-In[n])
- TC: O(ns)
- SC: O(ns)

[2, 1, 2, 3, 4]

|       | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
| ----- | - | - | - | - | - | - | - |
|       | T | F | F | F | F | F | F |
| 2     | T | F | T | F | F | F | F |
| 21    | T | T | T | T | F | F | F |
| 212   | T | T | T | T | T | T | F |
| 2123  | T | T | T | T | T | T | T |
| 21234 | T | T | T | T | T | T | T |

<br>

## Coin Change 2

- knapsack 처럼 선택된경우 선택되지 않은 경우로 나누어 생각한다.
- dp(n, s) = dp(n-1, s) + dp(n, s - coin)
- TC: O(ns)
- TS: O(ns)

<img src = "/NoCodeProgram/images/ncp_dp_3.jpeg" width = "50%">

[1, 2, 3], sum = 5

|       | 0 | 1 | 2 | 3 | 4 | 5 |
| ----- | - | - | - | - | - | - |
|       | 1 | 0 | 0 | 0 | 0 | 0 |
| 1     | 1 | 1 | 1 | 1 | 1 | 1 |
| 1,2   | 1 | 1 | 2 | 2 | 3 | 3 |
| 1,2,3 | 1 | 1 | 2 | 3 | 4 | 5 |

```swift
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
```

<br>

## Longest Common Subsequence
- TC: O(mn)
- SC: O(mn)

<img src = "/NoCodeProgram/images/ncp_dp_4.jpeg" width = "50%">


<br>

## 참고 

- [코드없는 프로그래밍 - 코딩테스트 Dynamic Programming](https://www.youtube.com/playlist?list=PLDV-cCQnUlIa0owhTLK-VT994Qh6XTy4v) 