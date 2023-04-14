# Backtracking

- 모든 경우의 수를 효율적으로 찾는방법
- Decision Spaces를 정의하고 진행이 가능한 곳으로만 진행한다.
- 진행이 불가능하면 되돌아간다.

<br>

## LetterCombinations

```swift
func solutions(digits: String) -> [String] {
    let keypad: [String] = [
        "",
        "",
        "abc",
        "def",
        "ghi",
        "jkl",
        "mno",
        "pqrs",
        "tuv",
        "wxyz"
    ]
    if digits.count == 0 { return [] }

    var comb: [String] = []
    BT(index: 0, crntStr: [])
    return comb

    func BT(index: Int, crntStr: [Character]) { 
        var crntStr = crntStr
        if index == digits.count { 
            let newComb = String(crntStr)
            comb.append(newComb)
            return
        }

        let num: Int = Int(String(Array(digits)[index]))!
        let chars: String = keypad[num]
        for char in chars { 
            crntStr.append(char)
            BT(index: index+1, crntStr: crntStr)
            crntStr.removeLast()
        }
    }
}

print(solutions(digits: "259"))
```

<br>

## Subsets
[LeetCode 78.Subsets](https://leetcode.com/problems/subsets/)

```swift
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
```

<br>

## Permutations
- O(n*n!)

```swift
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
```

<br>
<br>

## 참고 

- [코드없는 프로그래밍 - 코딩테스트 Dynamic Programming](https://www.youtube.com/playlist?list=PLDV-cCQnUlIa0owhTLK-VT994Qh6XTy4v) 