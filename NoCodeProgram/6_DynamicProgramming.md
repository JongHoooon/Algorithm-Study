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