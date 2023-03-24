# 이진 탐색 알고리즘

- 순차 탐색: 리스트 안에 있는 특정한 `데이터를 찾기 위해 앞에서부터 데이터를 하나씩 확인`하는 방법
- 이진 탐색: `정렬되어 있는` 리스트에서 `탐색 범위를 절반씩 좁혀가며 데이터를 탐색`하는 방법
  - 시작점, 끝점, 중간점을 이용해 탐색 범위를 설정한다.

<br><br>

## 소스 코드
```swift
/*
재귀함수 사용
*/
func binarySearch(array: [Int], target: Int, start: Int, end: Int) -> Int? { 
    if start > end { return nil }
    
    let mid: Int = (start + end) / 2
    if array[mid] == target { return mid }
    else if array[mid] < target {
        return binarySearch(array: array, target: target, start: mid+1, end: end)
    } else {
        return binarySearch(array: array, target: target, start: start, end: mid-1)
    }
}

let array: [Int] = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

print(binarySearch(array: array, target: 7, start: 0, end: array.count-1))
```
```swift
/*
반복문(while) 사용
*/
func binarySearch(array: [Int], target: Int) -> Int? {    
    var start: Int = 0
    var end: Int = array.count - 1
    
    while start <= end { 
        let mid: Int = (start + end) / 2
        if array[mid] == target { return mid }

        if array[mid] > target { 
            end = mid - 1
        } else { 
            start = mid + 1
        }
    }
    return nil
}

let array: [Int] = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
if let result: Int = binarySearch(array: array, target: 7) { 
    print(result)
} else { 
    print("값이 존해하지 않습니다.")
}
```

<br><br>

## 시간 복잡도

> O(logN)

탐색  범위를 절반씩 줄여가며 구한다.

<br><br>

## 파라메트릭 서치(Parametric Search)

- 최적화 문제를 결정문제(yes or not)로 바꾸어 해결하는 기법이다.
  - 특정한 조건을 만족하는 가장 알맞은 값을 빠르게 찾는 최적화 문제
- 코딩테스트에서 주로 이진 탐색 이용해서 해결

<br><br>

## 떡볶이 떡 만들기

- `현재 이 높이로 자르면 조건을 만족할 수 있는가?`를 확인한 뒤에 조건 만족 여부에 따라 탐색 범위를 좁혀간다.
- 절단기의 높이가 매우 큼으로 `이진탐색`을 떠올려야 한다.

```swift
let NM: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N: Int = NM[0]
let M: Int = NM[1]
let array: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

var mid: Int = 0
func binarySearch(start: Int, end: Int, target: Int) { 
    if start >= end { return }

    mid = (start + end) / 2
    var sum: Int = 0
    for e in array { 
        if e > mid { sum += e - mid }
    }
    if sum == target { return }
    if sum < target { 
        binarySearch(start: start, end: mid-1, target: target)
    } else {
        binarySearch(start: mid+1, end: end, target: target)
    }
}

binarySearch(start: 0, end: array.max()!, target: M)
print(mid)
```

<br><br>

## 정렬된 배열에서 특정 수의 개수 구하기

```swift
let Nx: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
let arr: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N: Int = Nx[0]
let x: Int = Nx[1]

var mid: Int = 0
func binarySearchFirst(start: Int, end: Int, target: Int) -> Int {
    mid = (start + end) / 2
    if start >= end {       
        return arr[mid] == target ? mid : -1
    }
    if arr[mid] >= target { 
        return binarySearchFirst(start: start, end: mid-1, target: target)
    } else {
        return binarySearchFirst(start: mid+1, end: end, target: target)
    }
}

func binarySearchSecond(start: Int, end: Int, target: Int) -> Int { 
    if start >= end {      
        return arr[mid] == target ? mid : -1
    }
    mid = (start + end) / 2
    if arr[mid] > target { 
        return binarySearchSecond(start: start, end: mid-1, target: target)
    } else {
        return binarySearchSecond(start: mid+1, end: end, target: target)
    }
}

let i1: Int = binarySearchFirst(start: 0, end: arr.count-1, target: x)
let i2: Int = binarySearchSecond(start: 0, end: arr.count-1, target: x)

print(i1 == -1 ? -1 : i2 - i1 + 1)
```

<br><br>

## 참고

- https://youtu.be/94RC-DsGMLo