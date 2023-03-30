# Sorting

## Bubble Sorting
- stable 하다
- 평균 시간복잡도 O(n^2)

```swift
func bubbleSort(numStrs: inout [(Int, String)]) -> [(Int, String)] { 
    for i in 0..<numStrs.count-1 { 
        for j in 0..<numStrs.count-1-i { 
            if numStrs[j].0 > numStrs[j+1].0 { 
                numStrs.swapAt(j, j+1)
            }
        }
    }
    return numStrs
}

var arr: [(Int, String)] = [(7, "a"), (5, "a"), (5, "b"), (7, "b"), (3, "c")] 

print(bubbleSort(numStrs: &arr))
// [(3, "c"), (5, "a"), (5, "b"), (7, "a"), (7, "b")]
```

<br>

## Insertion Sorting
- stable 하다
- 평균 O(n^2)
  
```swift
func insertionSort(nums: inout [Int]) -> [Int] { 
    for i in 1..<nums.count { 
        let tmp: Int = nums[i]
        var j: Int = i - 1
        while j >= 0 && tmp < nums[j] { 
            nums[j+1] = nums[j]
            j -= 1 
        }
        nums[j+1] = tmp
    }
    return nums
}

func insertionSort(nums: inout [Int]) -> [Int] { 
    for i in 1..<nums.count { 
        let tmp: Int = nums[i]
        var j: Int = i - 1
        while j >= 0 && tmp < nums[j] { 
            nums.swapAt(j, j+1)
            j -= 1 
        }
    }
    return nums
}

var arr: [Int] = [9, 3, 5, 7, 1]
print(insertionSort(nums: &arr))
// [1, 3, 5, 7, 9]
```

<br>

## Selection Sort
- O(n^2)
- unstable 하다.

```swift
func slectionSort(numStrs: inout [(Int, String)]) -> [(Int, String)] { 
    for i in 0..<numStrs.count-1 {
        var minNum: Int = numStrs[i].0
        var minIdx: Int = i
        for j in i..<numStrs.count { 
            if numStrs[j].0 < minNum { 
                minNum = numStrs[j].0
                minIdx = j
            }
        }
        numStrs.swapAt(i, minIdx)
    }
    return numStrs
}


var arr: [(Int, String)] = [(7, "a"), (5, "a"), (5, "b"), (7, "b"), (3, "c")] 
print(slectionSort(numStrs: &arr))
// [(3, "c"), (5, "a"), (5, "b"), (7, "b"), (7, "a")]
```

<br>

## Merge Sort
- 시간복잡도: O(nlogn)
- stable 하다

```swift
func mergeSort(nums: [Int]) -> [Int] { 
    let count: Int = nums.count
    if count == 1 { return nums }

    let mid: Int = count / 2

    let leftNums: [Int] = Array(nums[0..<mid])
    let rightNums: [Int] = Array(nums[mid..<count])

    let sortedLeft: [Int] = mergeSort(nums: leftNums)
    let sortedRight: [Int] = mergeSort(nums: rightNums)

    var sortedNums: [Int] = [] 
    var idxL: Int = 0
    var idxR: Int = 0

    while idxL < sortedLeft.count || idxR < sortedRight.count { 
        if idxL == sortedLeft.count { 
            sortedNums.append(sortedRight[idxR])
            idxR += 1
            continue
        }
        
        if idxR == sortedRight.count { 
            sortedNums.append(sortedLeft[idxL])
            idxL += 1
            continue
        }

        if sortedRight[idxR] <= sortedLeft[idxL] { 
            sortedNums.append(sortedRight[idxR])
            idxR += 1
        } else { 
            sortedNums.append(sortedLeft[idxL])
            idxL += 1
        }
    }

    return sortedNums
}

print(mergeSort(nums: [5, 7, 9, 3, 1, 2, 4]))
// [1, 2, 3, 4, 5, 7, 9]
```

<br>

## Quik Sort

<br>

### Quick Select

> 정렬되지 않은 배열에서 n번째로 큰/작은 element를 찾는 방법

- partioning을 사용
pivot을 사용해서 pivot보다 작은수, 큰수를 나눈다.


<br>

- 전체 정렬 후 검색
  - O(nlgn)
- heap 사용
  - O(nlgk)
- Quick Sort
  - worst: O(n^2)
  - best: O(n)
  - average: O(n)

<br>

#### [LeetCode 215. Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/description/)

```swift
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums: [Int] = nums
    let count = nums.count
    if count == 1 { return nums[0] }

    let pivot: Int = 0
    var left: Int = 1
    var right: Int = count - 1

    while left <= right {
        if nums[left] <= nums[pivot] {
            left += 1
            continue
        }

        if nums[right] > nums[pivot] {
            right -= 1
            continue
        }

        if nums[left] > nums[pivot] && nums[right] <= nums[pivot] {
            nums.swapAt(left, right)
            continue
        }
    }

    nums.swapAt(pivot, right)
    if right == count - k {
        return nums[right]
    } else if right > count - k {
        return findKthLargest(Array(nums[0..<right]), k - (count - right))
    } else {
        return findKthLargest(Array(nums[right+1..<count]), k)
    }
}
```

<br>

### Quick Sort

- 시간복잡도
  - worst: O(n^2)
  - average: O(nlgn)
  - best: O(nlgn)
- unstable 하다

<br>

## Heap Sort
- 시간복잡도: O(nlgn)
- unstable

```swift
struct Heap<T: Comparable> { 
    private var nodes: [T] = []
    let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) { 
        self.sort = sort
    }

    private func getParentIdx(_ index: Int) -> Int { 
        return (index - 1) / 2
    }

    private func getLeftChildIdx(_ index: Int) -> Int { 
        return index * 2 + 1
    }

    private func getRighChildtIdx(_ index: Int) -> Int {
        return index * 2 + 2
    }

    var isEmpty: Bool { 
        return nodes.isEmpty
    }


    mutating func insert(_ element: T) { 
        var index: Int = nodes.count
        nodes.append(element)
        while index > 0 && sort(nodes[index], nodes[getParentIdx(index)]) { 
            let parentIdx: Int = getParentIdx(index)
            nodes.swapAt(index, parentIdx)
            index = parentIdx
        }
    }

    mutating func pop() -> T? { 
        nodes.swapAt(0, nodes.count - 1)
        let popped: T? = nodes.popLast() 
        var index: Int = 0

        // 자식이 있는 경우
        while getLeftChildIdx(index) <= nodes.count - 1 { 
            let leftChildIdx: Int = getLeftChildIdx(index)
            let rightChildIdx: Int = getRighChildtIdx(index)

            // left, right 둘다 있는 경우
            if rightChildIdx < nodes.count { 
                let child: Int = sort(nodes[leftChildIdx], nodes[rightChildIdx]) ? leftChildIdx : rightChildIdx
                if sort(nodes[child], nodes[index]) { 
                    nodes.swapAt(child, index)
                    index = child
                } else { 
                    break
                }
            } else {  // left만 있는경우 
                if sort(nodes[leftChildIdx], nodes[index]) { 
                    nodes.swapAt(leftChildIdx, index)
                    index = leftChildIdx
                } else { 
                    break
                }
            }
        }
        return popped
    }
}

var arr: [Int] = [3, 5, 7, 9, 4, 2] 
var minHeap: Heap<Int> = Heap<Int>(sort: <) 

for e in arr { 
    minHeap.insert(e)
}

for i in arr.indices { 
    guard let popped: Int = minHeap.pop() else { break }
    arr[i] = popped
}

print(arr)
// [2, 3, 4, 5, 7, 9]
```

<br>

## Counting Sort

- 시간복잡도: O(n+k) (K: 가장작은수 ~ 가장큰수 범위)
- 범위가 너무 크면 비효율적이다.
- stable

```swift
func countingSort(nums: [Int]) -> [Int] { 
    let count: Int = nums.count
    let minNum: Int = nums.min()!
    let maxNum: Int = nums.max()!

    let range: Int = maxNum - minNum + 1
    var counts: [Int] = Array(repeating: 0, count: range)

    for num in nums { 
        counts[num-minNum] += 1
    }

    var accessCounts: [Int] = []
    var accessCount: Int = 0
    for count in counts { 
        accessCount += count
        accessCounts.append(accessCount)
    }
    accessCounts = accessCounts.map { $0 - 1}
    var sorted: [Int] = Array(repeating: 0, count: range)

    for i in stride(from: count-1, through: 0, by: -1) { 
        let num = nums[i]
        sorted[accessCounts[num]] = num
        accessCounts[num] -= 1
    }  
    return sorted
}

print(countingSort(nums: [3, 4, 0, 1, 2]))
print(countingSort(nums: [3, 0, 5, 1, 0, 5]))
// [0, 1, 2, 3, 4]
// [0, 0, 1, 3, 5, 5]
```

<br>

## Radix Sort

- counting sort 사용
- 자릿수 별로 정리한다.
- 시간복잡도: O(w*(n+k)) (w: 최대자릿수, k: 진법수)

```swift
import Foundation

func countingSortByDigit(nums: [Int], digit: Int) -> [Int] {
    let powed: Int = Int(pow(Double(10), Double(digit)))
    var counts: [Int] = Array(repeating: 0, count: 10)
    for num in nums {
        let countIdx: Int = num / powed % 10
        counts[countIdx] += 1
    }

    var accessCounts: [Int] = []
    var accessCount: Int = 0
    for count in counts {
        accessCount += count
        accessCounts.append(accessCount)
    }
    accessCounts = accessCounts.map { $0 - 1}
    var sorted: [Int] = Array(repeating: 0, count: nums.count)

    for num in nums.reversed() {
        let countIdx: Int = num / powed % 10
        let endLoc: Int = accessCounts[countIdx]
        sorted[endLoc] = num
        accessCounts[countIdx] -= 1
    }
    return sorted
}

func radixSort(nums: [Int]) -> [Int] {
    let maxNum: Int = nums.max()!
    let digits = String(maxNum).count
    var sorted: [Int] = nums
    for digit in 0..<digits {
        sorted = countingSortByDigit(nums: sorted, digit: digit)
        print(sorted)
    }
    return sorted
}

print(radixSort(nums: [391, 582, 50, 924, 8, 192]))
// [8, 50, 192, 391, 582, 924]
```

<br><br>

| |Bubble|Merge|Selection|Insertion|Quick|Heap|Counting|Radix|
|:---:|:----:|:---:|:------:|:----:|:----:|:---:|:-----:|:-----:|
|Best<br>Time|n^2|nlgn|n^2|n|nlgn|nlgn|n+k<br>(K:값의 범위)|d(n+k)<br>(d:자릿수,k:진수)|
|Average<br>Time|n^2|nlgn|n^2|n^2|nlgn|nlgn|n+k|n|
|Wrost<br>Time|n^2|nlgn|n^2|n^2|n^2|nlgn|n+k|n|
|Stability|O|O|X|O|X|X|O|O|

<br>

## 참고

- [코드없는 프로그래밍 - 코딩테스트 Sorting](https://www.youtube.com/playlist?list=PLDV-cCQnUlIZXLSUeF2Fav3_7X7ku-F63)