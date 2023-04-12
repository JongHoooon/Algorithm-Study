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

print(maxProduct([3, -2, 1, 0, -8, -9]))