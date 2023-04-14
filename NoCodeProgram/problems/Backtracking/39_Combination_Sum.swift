

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

print(combinationSum([2,3,6,7], 7))