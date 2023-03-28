# String

## String Matching
[LeetCode 28. Find the Index of the First Occurrence in a String](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/)

<br>

- O(n)
- KMP
  - [참고](https://www.youtube.com/watch?v=yWWbLrV4PZ8)
  - 어디까지 일치하는지 인덱스 사용해서 표시한다.
- Rolling-Hash
  - sliding window 사용해서 hash 값 비교


```swift
/*
KMP
*/
func strStr(_ haystack: String, _ needle: String) -> Int {
    return KMP(parent: haystack, pattern: needle)
}

func makeTable(_ pattern: String) -> [Int] { 
    let pattern: [Character] = Array(pattern)
    var table: [Int] = Array(repeating: 0, count: pattern.count)
    var j: Int = 0
    for i in 1..<pattern.count { 
        while j > 0 && pattern[i] != pattern[j] { 
            j = table[j - 1]
        }
        if pattern[i] == pattern[j] { 
            j += 1
            table[i] = j
        }
    }
    return table
}

func KMP(parent: String, pattern: String) -> Int { 
    let table: [Int] = makeTable(pattern)
    let parent: [Character] = Array(parent)
    let pattern: [Character] = Array(pattern)
    let parentCount: Int = parent.count
    let patternCount: Int = pattern.count
    var j: Int = 0
    for i in 0..<parentCount { 
        while j > 0 && parent[i] != pattern[j] {
            j = table[j-1]
        }
        if parent[i] == pattern[j] { 
            if j == patternCount - 1 { 
                return i - patternCount + 1
            } else { 
                j += 1
            }
        }
    }
    return -1
}
```

<br>

## Palindrome
[LeetCode 125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)

<br>

- 2개의 인덱스 사용해서 비교
- O(n)

```swift
func isPalindrome(_ s: String) -> Bool {
    let characters: [Character] = Array(s)
        .filter { $0.isLetter || $0.isNumber }
        .map { Character($0.lowercased()) }

    var left: Int = 0 
    var right: Int = characters.count-1
    while left < right { 
        if characters[left] != characters[right] { return false }
        left += 1
        right -= 1
    }

    return true
}
```

<br>

## Add Strings
[LeetCode 415. Add Strings](https://leetcode.com/problems/add-strings/description/)

<br>

- 32bit, 64bit에 담지 못하는 큰 수가 들어올 경우 Int로 변환해서 풀 수 없다.
- carry 사용해서 연산

```swift 
func addStrings(_ num1: String, _ num2: String) -> String {
    let num1: [Character] = Array(num1)
    let num2: [Character] = Array(num2)
    var idx1: Int = num1.count - 1
    var idx2: Int = num2.count - 1
    var answer: [Character] = []
    var carry: Int = 0

    while idx1 >= 0 && idx2 >= 0 { 
        let sum: Int = Int(String(num1[idx1]))! + Int(String(num2[idx2]))! + carry
        let num: Int = sum % 10
        carry = sum / 10
        answer.append(Character(String(num)))
        idx1 -= 1
        idx2 -= 1
    }

    while idx1 >= 0 { 
        let sum: Int = Int(String(num1[idx1]))! + carry
        let num: Int = sum % 10
        carry = sum / 10
        answer.append(Character(String(num)))
        idx1 -= 1
    }

    while idx2 >= 0 {
        let sum: Int = Int(String(num2[idx2]))! + carry
        let num: Int = sum % 10
        carry = sum / 10
        answer.append(Character(String(num)))
        idx2 -= 1
    }

    if carry != 0 { 
        answer.append(Character(String(carry)))
    }
    
    return String(answer.reversed())
}
```

<br>

## Group Anagrams
[LeetCode 49. Group Anagrams](https://leetcode.com/problems/group-anagrams/description/)

<br>

- 정렬후 해쉬 맵에 저장
  - O(nmlgm), O(nm)
- key를 알파벳 갯수를 기반으로 설정
  - O(nm)


```swift
func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard !strs.isEmpty else { return [] }

    var dict: [String: [String]] = [:]

    for str in strs { 
        let sortedStr: String = String(str.sorted())

        dict[sortedStr, default: []].append(str)
    }

    return Array(dict.values)
}
```

```swift
func groupAnagrams(_ strs: [String]) -> [[String]] {
    Array(
        Dictionary(
            grouping: strs,
            by: { $0.sorted().hashValue }
        )
        .values
    )
}
```

<br>

## Longest Substring W/O Repeats
[LeetCode 3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/description/)

<br>

- 알파벳 테이블
- 슬라이딩 윈도우

```swift
func lengthOfLongestSubstring(_ s: String) -> Int {
    let s: [Character] = Array(s)
    var checkTable: [Character: Int] = [:]
    var j: Int = 0
    var longest: Int = 0

    for (i, c) in s.enumerated() { 
        if checkTable[c, default: -1] == -1 { 
            checkTable[c] = i
        } else if j <= checkTable[c]! { 
            j = checkTable[c]! + 1 
            checkTable[c] = i
        } else if j > checkTable[c]! {
            checkTable[c] = i
        }
            
        checkTable[c] = i
        longest = max(longest, i - j + 1)
    }
    
    return longest
}
```

<br><br>

## 참고 

- [코드없는 프로그래밍 - 코딩테스트 String](https://youtube.com/playlist?list=PLDV-cCQnUlIZOsYWdD5u1Qo3ByXoC6CmZ)