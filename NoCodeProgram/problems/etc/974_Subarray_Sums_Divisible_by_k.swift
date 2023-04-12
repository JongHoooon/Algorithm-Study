
func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {

    var count: Int = 0
    var sum: Int = 0
    var dict: [Int: Int] = [0:1]
    for i in 0..<nums.count { 
        sum += nums[i]
        var remainder: Int = sum % k
        if remainder < 0 { 
            remainder += k
        }
        count += dict[remainder, default: 0]
        dict[remainder, default: 0] += 1
        print("remainder: \(remainder), sum: \(sum), count: \(count)")
        print(dict)


    }
    print(dict)

    return count
}

print(subarraysDivByK([4,5,0,-2,-3,1], 5)) 


func subarraySum(nums: [Int], k: Int) -> Int { 
    var cmlSums: [Int] = []
    var tmpSum: Int = 0

    for num in nums { 
        tmpSum += num
        cmlSums.append(tmpSum)
    }
    var table: [Int: [Int]] = [0:[-1]]
    var count: Int = 0

    for (i, cmlSum) in cmlSums.enumerated() { 
        let target: Int = cmlSum - k
        if let values: [Int] = table[target] { 
            count += values.count
        }
        table[cmlSum, default: []].append(i)
    }
    return count
}

print(subarraySum(nums: [6,3,2,5,3,-3], k: 10))