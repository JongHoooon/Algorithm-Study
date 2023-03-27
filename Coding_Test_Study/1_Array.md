
# Array

- index approach
- Sorting
  - heap
  - quick(NlgN)
  - merge
- Backtracking, Dynamic Programming로 이어지는 문제들이 많다.

<br>

## Binary Search

- 배열이 정렬됐을때 원하는 element를 찾는방법
- O(lgN)

```swift
func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left: Int = 0
    var right: Int = nums.count - 1

    while left <= right { 
        let pivot = (left + right) / 2
        if nums[pivot] == target { 
            return pivot
        } else if nums[pivot] < target {
            left = pivot + 1
        } else { 
            right = pivot - 1
        }
    }
    return -1
}
```

<br>

## Move Zeros
[LeetCode - 283. Move Zeroes](https://leetcode.com/problems/move-zeroes/)

<br>

- index 2개 사용 접근한다.

```swift
func moveZeroes(_ nums: inout [Int]) {     
        var wIdx: Int = 0
        for i in 0..<nums.count { 
            if nums[i] != 0 {
                nums.swapAt(wIdx, i)
                wIdx += 1
            }
        }
    }
```

<br>

## Find Pivot Index
[LeetCode - 724. Find Pivot Index](https://leetcode.com/problems/find-pivot-index)

<br>

- slicing을 사용하면 시간복잡도가 커진다. 
  - O(N^2)
- sliding window 사용해 시간복잡도 줄일 수 있다. 
  - O(N)


```swift
func pivotIndex(_ nums: [Int]) -> Int {        
    var rightSum: Int = nums.reduce(0, +)
    var leftSum: Int = 0
    var pastPivotNum = 0

    for (i, num) in nums.enumerated() { 
        leftSum += pastPivotNum
        rightSum -= num

        if leftSum == rightSum { 
            return i
        }
        pastPivotNum = num
    }
    return -1
}
```

<br>

## Minimum Size Subarray Sum
[LeetCode - 209. Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/)

<br>

- dynamic sliding widow
- [참고](https://www.youtube.com/watch?v=GcW4mgmgSbw)

```swift
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var minLength: Int = Int.max
    var leftIndex: Int = 0
    var rightIndex: Int = 0
    var currentSum: Int = 0

    while rightIndex < nums.count { 
        currentSum += nums[rightIndex]
        rightIndex += 1

        while leftIndex < rightIndex && currentSum >= target { 
            currentSum -= nums[leftIndex]
            leftIndex += 1

            minLength = min(minLength, rightIndex - leftIndex + 1)
        }
    }
    return minLength == Int.max ? 0 : minLength
}
```

<br>

## Sort Colors(Dutch Flag Problem)
[LeetCode - 75. Sort Colors
](https://leetcode.com/problems/sort-colors/)

<br>

- O(N)의 시간복잡도로 정렬
- quick sort의 원리 사용해서 정렬
  
```swift
func sortColors(_ nums: inout [Int]) {
    var idx0: Int = 0
    var idx2: Int = nums.count - 1
    var i: Int = 0

    while i <= idx2 {

        if nums[i] == 0 { 
            nums.swapAt(i, idx0)
            idx0 += 1
            i += 1
        } else if nums[i] == 2 { 
            nums.swapAt(i, idx2)
            idx2 -= 1
        } else { // nums[i] == 1
            i += 1
        }          
    }
}
```

<br>

## Merge Sorted Array
[LeetCode 88. Merge Sorted Array](https://leetcode.com/problems/merge-sorted-array/)

<br>

- 정렬된 2개의 배열을 합친다.
- 새로운 배열에 정렬하는것 처럼 nums1 배열의 빈 부분을 사용해 정렬한다.
- 시간복잡도: O(n+m)

```swift
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var num1Idx: Int = m - 1
    var num2Idx: Int = n - 1
    var wIdx: Int = nums1.count - 1

    if num2Idx < 0 { 
        return 
    }

    while 0 <= num1Idx && 0 <= num2Idx { 
        let num1 = nums1[num1Idx]
        let num2 = nums2[num2Idx]
        if num2 <= num1 { 
            nums1[wIdx] = num1
            wIdx -= 1
            num1Idx -= 1
        } else { 
            nums1[wIdx] = num2
            wIdx -= 1
            num2Idx -= 1
        }

    }

    while(0 <= num2Idx) { 
        nums1[wIdx] = nums2[num2Idx]
        num2Idx -= 1
        wIdx -= 1
    }
}
```

<br>

## Find Peak Element
[LeetCode 162. Find Peak Element](https://leetcode.com/problems/find-peak-element/description/)

<br>

- 그래프를 그려서 시각적으로 확인
- Binary Search 사용
- 시간복잡도: O(lgN)

```swift
func findPeakElement(_ nums: [Int]) -> Int {
    var left: Int = 0
    var right: Int = nums.count - 1

    if nums.count <= 1 { 
        return 0
    }

    while left < right { 
        let pivot = (left + right) / 2
        let num = nums[pivot]
        let nextNum = nums[pivot+1]

        if num < nextNum { 
            left = pivot + 1
        } else { 
            right = pivot 
        }
    }
    // return right
    return left
}
```
 
<br>

## Merge Intervals
[LeetCode 56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)

<br>

- 그림 그리기

  <img src = "/Coding_Test_Study/images/1.jpeg" width = "50%">  

- 기존의 interval들과 하나씩 비교하면 시간복잡도: O(N^2) 
- 시작 요소로 정렬하면 시간복잡도 줄일 수 있다: O(NlgN)

```swift
func merge(_ intervals: [[Int]]) -> [[Int]] {
    let intervals: [[Int]] = intervals.sorted(by: { $0[0] < $1[0] })
    var answer: [[Int]] = []

    for interval in intervals { 
        guard let last = answer.last else { 
            answer.append(interval)
            continue
        }
        if interval[0] <= last[1] && interval[1] >= last[1] { 
            answer[answer.count-1] = [last[0], interval[1]]
        } else if interval[0] > last[1] { 
            answer.append(interval)
        }
    }

    return answer
}
```

<br>

## Shortest Unsorted Continuous Subarray
[LeetCode 581. Shortest Unsorted Continuous Subarray](https://leetcode.com/problems/shortest-unsorted-continuous-subarray/description/)

<br>

- 그림 그려보기
  
  <img src = "/Coding_Test_Study/images/2.jpeg" width = "50%">

```swift
func findUnsortedSubarray(_ nums: [Int]) -> Int {
    var previous: Int = Int.min
    var disorderEnd: Int = -1

    for i in 0..<nums.count { 
        if previous <= nums[i] { 
            previous = nums[i]
        } else { 
            disorderEnd = i
        }
    }

    if disorderEnd == -1 { return 0 }
    
    previous = Int.max
    var disorderStart = -1

    for j in stride(from: nums.count-1, through: 0, by: -1) { 
        if previous >= nums[j] { 
            previous = nums[j]
        } else { 
            disorderStart = j
        }
    }
    return disorderEnd - disorderStart + 1
}
```

<br>

## Find Duplicate
[LeetCode 287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number/description/)

<br>

- 브루트 포스: O(N^2)
- 정렬후 확인: O(lgN)
- Dynamic Programming: O(N), O(N)
- 기존 배열을 활용하면 공간복잡도 절약할 수 있다: O(N), O(1)
  - array에 있는 element를 index로 생각
  - -1을 곱해줘서 방문했는지 표시
- 그래프를 사용하면 기존의 배열을 변경하지 않고 찾을 수 있다.
  - [Floyd's Cycle Detection](https://youtu.be/PvrxZaH_eZ4?t=89)
  - [참고](https://leetcode.com/problems/find-the-duplicate-number/solutions/543300/swift-solution-with-explanation/?languageTags=swift)
  - [참고](https://leetcode.com/problems/find-the-duplicate-number/solutions/3186979/tc-o-n-sc-o-1/?languageTags=swift)
  
```swift
unc findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0], fast = nums[nums[0]]
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        var slow2 = 0
        while slow != slow2 {
            slow = nums[slow]
            slow2 = nums[slow2]
        }
        return slow
    }
```

<br>

## 2sum, 3sum, 4sum
[LeetCode 1. Two Sum](https://leetcode.com/problems/two-sum/description/)

<br>

- Hash Map 사용하면 O(N), O(N)으로 해결 가능
- 정렬후 left, right 인덱스 만들어서 합이 target보다 크면 right 감소 작으면 left 증가: O(lgN) + O(N) 

```swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let sotredNums: [Int] = nums.sorted()
    var left: Int = 0
    var right: Int = nums.count - 1

    while left < right { 
        let sum: Int = sotredNums[left] + sotredNums[right]
        if sum > target { right -= 1 }
        else if sum < target { left += 1 }
        else { break }
    }
    left = nums.firstIndex(of: sotredNums[left])!
    right = nums.lastIndex(of: sotredNums[right])!

    return [left, right]        
}
```

<br><br>

## 참고

- [코드없는 프로그래밍_코딩테스트_Arrays](https://www.youtube.com/playlist?list=PLDV-cCQnUlIYFOXYzqLoXnEye4WxDa_30)