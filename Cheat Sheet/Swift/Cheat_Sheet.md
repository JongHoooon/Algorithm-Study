# Swift Cheat Sheet

## 조합(Combination)

```swift
let nums = [1, 2, 3, 4, 5]

func makeCombination(depth: Int, index: Int, currentArray: [Int]) {
  if depth == 3 { 
    print(currentArray)
    return 
  }

  for i in index..<nums.count { 
    makeCombination(depth: depth + 1, index: i + 1, currentArray: currentArray + [nums[i]])
  }
}

makeCombination(depth: 0, index: 0, currentArray: [])
```

<br>

## 순열(Permutation)
```swift
let nums = [1, 2, 3, 4, 5, 6]
var visited = Array(repeating: false, count: nums.count)

func makePermutation(currentNums: [Int]) { 
  if currentNums.count == 3 { 
    print(currentNums)
  }

  for i in 0..<nums.count { 
    if visited[i] == true { 
      continue
    } else { 
      visited[i] = true
      makePermutation(currentNums: currentNums + [nums[i]])
      visited[i] = false
    }
  }
}

makePermutation(currentNums: [])
```

<br>

## Index -> distance 로 변환
```swift
let index = pattern.firstIndex(of: "*")!
let distance = pattern.distance(from: pattern.startIndex, to: index)
```