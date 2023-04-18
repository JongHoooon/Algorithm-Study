# Backtracking

- 모든 경우의 수를 효율적으로 찾는방법
- Decision Spaces를 정의하고 진행이 가능한 곳으로만 진행한다.
- 진행이 불가능하면 되돌아간다.

<br>

1. Exit Condition
  재귀를 멈추는 조건

2. Processing Parting
  다음에 사용할 후보 찾기

3. Function Call
  재귀 형태로 함수 실행

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

## Combination Sum
[LeetCode 39.Subsets](https://leetcode.com/problems/combination-sum/)
- TC: O(n^depth+1)
- SC: (Sum / m) (m:코드 중에 가장 작은수), 트리의 깊이


<br>

## 참고 

- [코드없는 프로그래밍 - 코딩테스트 Dynamic Programming](https://www.youtube.com/playlist?list=PLDV-cCQnUlIa0owhTLK-VT994Qh6XTy4v) 

<br>

- [1, 2, 3], sum = 5

<img src="/NoCodeProgram/images/Backtracking/BT_1.jpeg" width="50%">


```swift
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
```

<br>

## IP 주소 복구

- [200523125]

<img src="/NoCodeProgram/images/Backtracking/BT_2.jpeg" width="50%">


```swift
func restoreIpAddresses(_ s: String) -> [String] {
    let chars: [Character] = Array(s)

    func valid(numChars: [Character]) -> Bool { 
        if numChars.count == 1 {
            return true
        }
        if numChars[0] == "0" {
            return false
        }
        if 255 < Int(String(numChars))! {
            return false
        }
        return true
    }

    func BT(_ idx: Int, IPs: [String]) {
        var IPs = IPs

        // Exit Condition
        if 4 < IPs.count { return }
        else if idx == chars.count && IPs.count == 4 {
            let IP: String = IPs.joined(separator: ".") 
            answer.append(IP)
            return 
        }

        let charsCount: Int = chars.count
        let idxP3: Int = idx + 3
        var num: [Character] = [] 

        // Candiates Filtering
        for i in idx..<min(idxP3, charsCount) { 
            num.append(chars[i])
            if valid(numChars: num) { 
                IPs.append(String(num))

                // Recursive Call
                BT(idx+num.count, IPs: IPs)
                let _ = IPs.removeLast()
            }
        }
        return
    }

    var answer: [String] = []
    BT(0, IPs: [])
    return answer
}
```

<br>

## 메트릭스 단어 찾기
[LeetCode 79. Word Search](https://leetcode.com/problems/word-search/description/)
- TC: O(m * n * 3^(s+1)) (m: rows, n: cols, 3: 상하좌우에서 이전거 제외, s: target 문자열길이))
- SC: O(m * n + s)


```swift
func exist(_ board: [[Character]], _ word: String) -> Bool {

    if word.count == 0 { return true }
    
    let rows: Int = board.count
    if rows == 0 { return false }

    let cols: Int = board[0].count
    if cols == 0 { return false }

    let word: [Character] = Array(word)
    var isVisited: [[Bool]] = Array(
        repeating: Array(repeating: false, count: cols),
        count: rows
    )

    func bt(y: Int, x: Int, idx: Int) -> Bool { 

        if idx == word.count { 
            return true
        } else if !((0..<board.count) ~= y) {
            return false
        } else if !((0..<board[0].count) ~= x) { 
            return false
        } else if isVisited[y][x] { 
            return false
        } else if board[y][x] != word[idx] {
            return false
        }

        isVisited[y][x] = true

        if bt(y: y-1, x: x, idx: idx+1) { 
            return true
        } else if bt(y: y, x: x+1, idx: idx+1) {
            return true
        } else if bt(y: y+1, x: x, idx: idx+1) { 
            return true
        } else if bt(y: y, x: x-1, idx: idx+1) {
            return true
        }
        isVisited[y][x] = false

        return false
     }

    for y in 0..<rows {
        for x in 0..<cols { 
            let answer = bt(y: y, x: x, idx: 0)
            if answer { return answer }
        }
    }

    return false
}
```