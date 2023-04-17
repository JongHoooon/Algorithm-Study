
/*
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    func BT(_ index: Int, _ crntNums: [Int]) { 
        var crntNums = crntNums
        let sum: Int = crntNums.reduce(0, +)
        if sum >= target {
            if sum == target { 
                answer.append(crntNums)
            }
            return
        }

        for (i, n) in candidates.enumerated() {
            if i < index { continue }
            crntNums.append(n)
            BT(i, crntNums)
            let _ = crntNums.removeLast()
        }
    }

    var answer: [[Int]] = []
    BT(0, [])
    return answer
}
*/

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    func BT(_ index: Int, _ crntNums: [Int], _ targetSum: Int) { 
        var crntNums: [Int] = crntNums

        // Exit Condition
        if targetSum <= 0 { 
            if targetSum == 0 { 
                answer.append(crntNums)
            }
            return
        }

        // Process (candiated filtering)
        for i in index..<candidates.count {
            let n: Int = candidates[i]
            crntNums.append(n)

            // Recursion call
            BT(i, crntNums, targetSum-n)
            let _ = crntNums.removeLast()
        }
    }

    var answer: [[Int]] = []
    BT(0, [], target)
    return answer
}

print(combinationSum([2,3,6,7], 7))
print(combinationSum([1, 2, 3], 5))