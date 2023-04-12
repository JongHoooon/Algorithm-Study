
func maxSubArray(_ nums: [Int]) -> Int {
    var dp: [Int] = Array(repeating: -1, count: nums.count)
    dp[0] = nums[0]

    for i in 1..<nums.count { 
        dp[i] = max(nums[i], nums[i]+dp[i-1])
    }

    return dp.max() ?? -1
}

