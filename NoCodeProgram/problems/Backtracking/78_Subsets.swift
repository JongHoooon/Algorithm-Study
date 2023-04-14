
func subsets(_ nums: [Int]) -> [[Int]] {

    var subsets: [[Int]] = []
    BT(index: 0, crntSet: [])

    return subsets

    func BT(index: Int, crntSet: [Int]) {
        var crntSet = crntSet
        if index == nums.count { 
            subsets.append(crntSet)
            return
        }
        
        let num = nums[index]
        BT(index: index+1, crntSet: crntSet)
        crntSet.append(num)
        BT(index: index+1, crntSet: crntSet)
        let _ = crntSet.removeLast()
    }
}

print(subsets([1, 2, 3]))