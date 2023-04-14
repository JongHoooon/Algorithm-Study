
func permute(_ nums: [Int]) -> [[Int]] {

    var perms: [[Int]] = []
    BT(crntSet: [])
    return perms

    func BT(crntSet: [Int]) { 
        var crntSet = crntSet
        if crntSet.count == nums.count { 
            perms.append(crntSet)
            return
        }

        for num in nums { 
            if crntSet.contains(num) {
                continue
            }
            crntSet.append(num)
            BT(crntSet: crntSet)
            let _ = crntSet.removeLast()
        }
    }
}

print(permute([1, 2, 3]))