# Hash Table

- Insertion, find
  - O(1)
- sort 불가능
- key-value 관계

<br>

## First Unique Character in a String
[LeetCode 387. First Unique Character in a String](https://leetcode.com/problems/first-unique-character-in-a-string/)

- 시간복잡도: O(n) 
- 공간복잡도: O(1)

```swift
func firstUniqChar(_ s: String) -> Int {
    var chars: [Character] = Array(s)
    var countDict: [Character: Int] = [:]         

    for c in chars { 
        countDict[c, default: 0] += 1
    }

    for (i, c) in chars.enumerated() { 
        guard let count = countDict[c] else { continue }
        if count == 1 { 
            return i
        }
    }
    return -1
}
```

<br>

## Isomorphic Strings
[LeetCode 205. Isomorphic Strings](https://leetcode.com/problems/isomorphic-strings)

<br>

```swift
func isIsomorphic(_ s: String, _ t: String) -> Bool {
    let s: [Character] = Array(s)
    let t: [Character] = Array(t)
    var dict1: [Character: Character] = [:]
    var dict2: [Character: Character] = [:]

    for i in s.indices { 
        let character1 = dict1[s[i]]
        let character2 = dict2[t[i]]

        if character1 == nil && character2 == nil { 
            dict1[s[i]] = t[i]
            dict2[t[i]] = s[i]
            continue
        } else if character1 == t[i] && character2 == s[i] { 
            continue
        }

        return false
    }
    return true
}
```

<br>

## Valid Anagram
- table 사용
  - O(n)
- 정렬 사용
  - O(nlogn)

<br>

## Top K Frequent Elements
[LeetCode 347. Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/description/)

- 테이블 만들고 정렬
  - O(nlogn)
- 테이블 만들고 heap 사용하면 더 줄일 수 있다.
  - O(logK)
  
<br>

```swift
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    var dict: [Int: Int] = [:]
    
    for n in nums {
        dict[n, default: 0] += 1
    }
    var maxHeap = Heap<(Int, Int)>(sort: {
        $0.1 > $1.1
    })

    for e in Array(dict) {
        maxHeap.insert(e)
    }

    var answer: [Int] = []
    for _ in 0..<k {
        guard let popped = maxHeap.pop() else {
            break
        }
        answer.append(popped.0)
    }
    return answer
}

print(topKFrequent([1,1,1,2,2,3], 2))

struct Heap<T> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    private func getParentIdx(_ idx: Int) -> Int {
        return (idx - 1) / 2
    }

    private func getLChildIdx(_ idx: Int) -> Int {
        return idx * 2 + 1
    }

    private func getRChildIdx(_ idx: Int) -> Int {
        return idx * 2 + 2
    }

    mutating func insert(_ element: T) {
        var idx: Int  = nodes.count
        nodes.append(element)
        while idx > 0 && sort(nodes[idx], nodes[getParentIdx(idx)]) {
            let parentIdx = getParentIdx(idx)
            nodes.swapAt(idx, parentIdx)
            idx = parentIdx
        }
    }

    mutating func pop() -> T? {
        nodes.swapAt(0, nodes.count-1)
        let popped: T? = nodes.popLast()
        var idx: Int = 0

        while getLChildIdx(idx) <= nodes.count - 1 {
            let leftChildIdx = getLChildIdx(idx)
            let rightChildIdx = getRChildIdx(idx)

            if getRChildIdx(idx) <= nodes.count - 1 {
                let childIdx: Int = sort(nodes[leftChildIdx], nodes[rightChildIdx]) ? leftChildIdx : rightChildIdx

                if sort(nodes[childIdx], nodes[idx]) {
                    nodes.swapAt(childIdx, idx)
                    idx = childIdx
                } else {
                    break
                }
            } else {
                if sort(nodes[leftChildIdx], nodes[idx]) {
                    nodes.swapAt(leftChildIdx, idx)
                    idx = leftChildIdx
                } else {
                    break
                }
            }
        }
        return popped
    }
}
```

<br>

## Random HashSet

- 테이블에 숫자, 인덱스를 기록
  
<br>

## Subarray Sum

- 양수만 있으면 sliding window
  - O(n)
- 음수도 있는경우 accumulate array를 만들고 target만큼 차이 나는 2 원소를 찾는다.
  - two sum의 hash map을 사용해서 찾는 방법으로 찾는다.
  - 0: -1 쌍을 추가해 target 1개만 있는경우 대응
  - O(n)

```swift
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
```

<br>

[LeetCode 974. Subarray Sums Divisible by K](https://leetcode.com/problems/subarray-sums-divisible-by-k/)

```swift
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
```

<br>

## Contiguous Array
- b를 1, a를 -1로 변경후 큐물레이트 섬, 해쉬맵 사용해서 구한다.


<br>

## 참고 

- [코드없는 프로그래밍 - 코딩테스트 Hash Map](https://www.youtube.com/playlist?list=PLDV-cCQnUlIYjwJ_b-f8Z0OQlIqKpMkDr) 