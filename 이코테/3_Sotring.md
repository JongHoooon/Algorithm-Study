

# 정렬(Sorting)

> 데이터를 특정한 기준에 따라 순서대로 나열하는 것

<br>

## 선택 정렬

> 처리되지 않은 데이터 중에서 `가장 작은 데이터를 선택해 맨 앞에 있는 데이터와 바꾸는 것을 반복`한다.

<br>

### 소스 코드

```swift
/*
Swift
*/
var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in 0..<array.count {
    var minIndex = i
    for j in i+1..<array.count {
        if array[minIndex] > array[j] {
            minIndex = j
        }
    }
    array.swapAt(i, minIndex)   
}

// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

```python
"""
Python
"""
array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in range(len(array)):
    min_index = i
    for j in range(i+1, len(array)):
        if array[min_index] > array[j]:
            min_index = j
    array[i], array[min_index] = array[min_index], array[i]

# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

<br>

### 시간 복잡도

> O(N^2)

- N + (N-1) + (N-2) + ... + 2
- (N^2 + N - 2) / 2

<br><br>

## 삽입 정렬

<br>

### 소스 코드

> 처리되지 않은 데이터를 하나씩 골라 `적절한 위치에 삽입` 한다.

```swift
var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in 0..<array.count {
    for j in stride(from: i, to: 0, by: -1) {
        if array[j-1] > array[j] {
            array.swapAt(j-1, j)
        } else {
            break
        }
    }
}

print(array)
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```
```python
array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in range(1, len(array)):
    for j in range(i, 0, -1):
        if array[j] < array[j-1]:
            array[j], array[j-1] = array[j-1], array[j]
        else:
            break

print(array)
# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

<br>

### 시간 복잡도

> O(N^2)

- 거의 정렬되어 있는 상태라면 매우 빠르게 동작한다.
  - 최선의 경우 O(N)의 시간 복잡도를 가진다.

<br>
<br>

## 퀵 정렬

> `기준 데이터를 설정`하고 그 기준보다 큰 데이터와 작은 데이터의 위치를 바꾸는 방법

<br>

### 소스 코드
```swift
/*
오름차순 정렬
*/
var array: [Int] = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

func quickSort(start: Int, end: Int) {
    if start >= end { return } // 원소가 1개인 경우 죵로
    
    let pivot: Int = start // 보통 첫 번째 원소로 피벗
    var left: Int = pivot + 1
    var right: Int = end
    while left <= right {
        // 피벗보다 큰 데이터를 찾을 때까지 반복
        while left <= end && array[pivot] >= array[left] {
            left += 1
        }
        // 피벗보다 작은 데이터를 찾을 때까지 반복
        while right > start && array[pivot] <= array[right] {
            right -= 1
        }
        // 엇갈렸다면 피벗보다 작은 데이터와 피벗 스왑
        if left > right {
            array.swapAt(pivot, right)
        } else {
        // 엇갈리지 않았다면 작은 데이터 와 큰 데이터를 교체
        array.swapAt(left, right)
        }
    }
    quickSort(start: start, end: right-1)
    quickSort(start: right+1, end: end)
}

quickSort(start: 0, end: array.count-1)
print(array)
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```
```python
"""
내림차순 정렬
"""
array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

def quick_sort(array, start, end):
    if start >= end: return
    
    pivot = start
    left = start+1
    right = end
    
    while left <= right:
        while left <= end and array[pivot] <= array[left]:
            left += 1
        while right > start and array[pivot] >= array[right]:
            right -= 1
        if left > right:
            array[pivot], array[right] = array[right], array[pivot]
        else:
            array[left], array[right] = array[right], array[left]
    
    quick_sort(array, start, right-1)
    quick_sort(array, right+1, end)

quick_sort(array, 0, len(array)-1)
print(array)
# [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
```

### 시간 복잡도
> 평균 O(NlogN)
> 최악의 경우 O(N^2)

<br>
<br>

## 계수 정렬
> 특정한 조건이 부합할 때만 사용할 수 있지만 매우 빠르게 동작한다. <br><br>
> 데이터의 크기 범위가 제한되어 정수 형태로 표한할 수 있을 때 사용 가능하다.

### 소스 코드

```swift
let array: [Int] = [7, 5, 9, 0, 3, 1, 6, 2, 9, 1, 4, 8, 0, 5, 2]
var counter: [Int] = Array(repeating: 0, count: array.count+1)

for i in 0..<array.count { 
    counter[array[i]] += 1
}

for i in 0..<counter.count {
    for _ in 0..<counter[i] {
        print(i, terminator: " ")
    }
}

// 0 0 1 1 2 2 3 4 5 5 6 7 8 9 9
```

```python
array = [7, 5, 9, 0, 3, 1, 6, 2, 9, 1, 4, 8, 0, 5, 2]
count = [0]*(max(array)+1)

for i in range(len(array)):
    count[array[i]] += 1

for i in range(len(count)):
    for j in range(count[i]):
        print(i, end=" ")

# 0 0 1 1 2 2 3 4 5 5 6 7 8 9 9
```

### 시간 복잡도

> O(N+K)

- 데이터의 개수가 N, 데이터(양수) 중 최댓값이 K일 때 최악의 경우에도 수행 시간 O(N+K)를 보장한다.
- 공간 복잡도: O(N+K)
- 데이터의 범위가 너무 크면 비효율 적이다
  - 0, 999999 2개만 존재할 때
- 동일한 값을 가지는 데이터가 여러 개 등잘할때 사용하면 좋다.



<br><br>

## 비교

|정렬 알고리즘|평균 시간 복잡도|공간 복잡도|특징|
|------------|----------------|-----------|-----|
|선택 정렬| O(N^2)| O(N)| 아이디어가 간단하다.|
|삽입 정렬| O(N^2)| O(N)|데이터가 거의 정렬되어 있을 때는 가장 빠르다.|
|퀵 정렬|O(NlogN)|O(N)|대부분의 경우에 가장 적합하며, 충분히 빠르다.|
|계수 정렬|O(N+K)|O(N+K)|데이터의 크기가 한정되어 있는 경우에만 사용이 가능하지만 매우 빠르다.|

<br><br>

## 참고

- https://youtu.be/KGyK-pNvWos
