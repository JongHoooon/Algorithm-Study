
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


print(minCostClimbingStairs([1,2,4,6,2,4,6,1]))