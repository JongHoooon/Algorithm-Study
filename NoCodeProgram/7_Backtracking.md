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

<br>

## 스도쿠 풀기

- [LeetCode 37. Sudoku Solver](https://leetcode.com/problems/sudoku-solver/)

```swift
func solveSudoku(_ board: inout [[Character]]) {

    let next = findNextEmpty()
    if next[0] == 9 && next[1] == 9 { 
        return
    }

    for i in 1..<9 { 
        let num = Character(String(i))
        bt(row: next[0], col: next[1], num: num)
    }

    func checkRow(row: Int, num: Character) -> Bool {
        for x in 0..<9 { 
            if board[row][x] == num { 
                return false
            }
        }
        return true
    }
    
    func checkCol(col: Int, num: Character) -> Bool {
        for y in 0..<9 { 
            if board[y][col] == num { 
                return false
            }
        }
        return true
    }

    func check33(row: Int, col: Int, num: Character) -> Bool { 
        let boxX = Int(col/3) * 3
        let boxY = Int(row/3) * 3 

        for y in boxY..<boxY+3 { 
            for x in boxX..<boxX+3 { 
                if board[y][x] == num { 
                    return false
                }
            }
        }
        return true
    }

    func findNextEmpty() -> [Int] { 
        for y in 0..<9 {
            for x in 0..<9 {
                if board[y][x] == "." { 
                    return [y, x]
                }
            }
        }
        return [9, 9]
    }

    func bt(row: Int, col: Int, num: Character) -> Bool { 
        if !checkRow(row: row, num: num) { return false }
        if !checkCol(col: col, num: num) { return false }
        if !check33(row: row, col: col, num: num) { return false }

        board[row][col] = num
        let next = findNextEmpty()
        let nextRow = next[0]
        let nextCol = next[1]

        // Sudoku solved!
        if nextRow == 9 && nextCol == 9 { return true }

        // next function cell
        for nextNum in 1..<10 { 
            let nextNum = Character(String(nextNum))
            if bt(row: nextRow, col: nextCol, num: nextNum) { 
                return true
            }
        }

        // rollback when all cadiates returned False
        board[row][col] = "."
        return false
    }
}
```

<br>

## N-Queens

- [LeetCode 51. N-Queens](https://leetcode.com/problems/n-queens/)

```swift 
func solveNQueens(_ n: Int) -> [[String]] {

    var result: [[String]] = []
    var colSet: Set<Int> = []
    var diagSet1: Set<Int> = []
    var diagSet2: Set<Int> = []

    for x in 0..<n { 
        bt(row: 0, col: x, board: [])
    } 

    func createStrRow(col: Int) -> String { 
        var strArray = Array(repeating: ".", count: n)
        strArray[col] = "Q"
        return strArray.joined()
    }

    func bt(row: Int, col: Int, board: [String]) {
        var board: [String] = board

        // exit condition
        if row == n || col == n { return }
        if colSet.contains(col) { return }

        let diagInfo1 = row - col
        let diagInfo2 = row + col

        if diagSet1.contains(diagInfo1) { return }
        if diagSet2.contains(diagInfo2) { return }

        // process
        let strLine: String = createStrRow(col: col)
        board.append(strLine)

        if board.count == n { 
            result.append(board)
            _ = board.removeLast()
            return 
        }

        // duplicate sets
        colSet.insert(col)
        diagSet1.insert(diagInfo1)
        diagSet2.insert(diagInfo2)

        // recursive calls 
        for x in 0..<n { 
            bt(row: row+1, col: x, board: board)
        }

        // duplicates sets pop
        diagSet2.remove(diagInfo2)
        diagSet1.remove(diagInfo1)
        colSet.remove(col)
        _ = board.removeLast()
    }

    return result
}
```

<br>

## Generate Parentheses

- [LeetCode 131. Palindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning/)

```swift
func partition(_ s: String) -> [[String]] {

    let s: [Character] = Array(s)
    if s.count == 0 { return [] }

    var result: [[String]] = []

    for i in 0..<s.count { 
        bt(begin: 0, last: i, letters: [])
    }

    func isPalindrome(begin: Int, last: Int) -> Bool { 
        var begin = begin
        var last = last
        while begin < last { 
            if s[begin] != s[last] { return false } 
            begin += 1
            last -= 1
        }
        return true
    }

    func bt(begin: Int, last: Int, letters: [[Character]]) {
        var letters = letters

        if !isPalindrome(begin: begin, last: last) { return }

        letters.append(Array(s[begin...last]))

        if s.count == last + 1 { 
            result.append(letters.map { String($0) })
            return
        }

        for idx in last+1..<s.count { 
            bt(begin: last+1, last: idx, letters: letters)
        }

        return
    }

    return result
}
```
