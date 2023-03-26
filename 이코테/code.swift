

/*
for i in 0..<array.count {
    var minIndex = i
    for j in i+1..<array.count {
        if array[minIndex] > array[j] {
            minIndex = j
        }
    }
    array.swapAt(i, minIndex)   
}

print(array)
*/

/*
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
*/

/*
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
*/

/*
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
*/

/*
func solution(_ n: Int) {
    var count: Int = 0

    for i in 0..<3600 { 
        var str: String = ""
        str.append("\(i/60)")
        str.append("\(i%60)")
        if str.contains("3") { 
            count += 1
        }
    }

    var answer: Int = 0
    for i in 0...n {
        if i == 3 { 
            answer += 3600
        } else { 
            answer += count
        }
    }
    print(answer)
}

solution(5)
*/

// let graph: [[Int]] = [
//     [],
//     [2, 3, 8],
//     [1, 7],
//     [1, 4, 5],
//     [3, 5],
//     [3, 4],
//     [7],
//     [2, 6, 8],
//     [1, 7]
// ]


// var visited: [Bool] = Array(repeating: false, count: 9)

// func bfs(v: Int) { 
//     var queue: [Int] = [v]
//     visited[v] = true

//     while !queue.isEmpty {
//         let node: Int = queue.removeFirst()
//         print(node, terminator: " ")
//         for next in graph[node] { 
//             if !visited[next] {
//                 queue.append(next)
//                 visited[next] = true
//             }
//         }
//     }
// }

// bfs(v: 1)

/*
func dfs(v: Int) { 
    visited[v] = true
    print(v, terminator: " ")

    for n in graph[v] {
        if !visited[n] {
            dfs(v: n)
        }
    }
}

dfs(v: 1)
*/

/*
let NM: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N: Int = NM[0]
let M: Int = NM[1]
let dx: [Int] = [1, -1, 0, 0]
let dy: [Int] = [0, 0, -1, 1]
var graph: [[Int]] = []
var isVisited: [[Bool]] = Array(
    repeating: Array(repeating: false, count: M),
    count: N
    )

for _ in 0..<N {
    let input: [Int] = Array(readLine()!)
        .map { Int(String($0))! }
        
    graph.append(input)
}

func dfs(x: Int, y: Int) {
    isVisited[x][y] = true

    for i in dx.indices {
        let nx: Int = x + dx[i]
        let ny: Int = y + dy[i]
        guard 0..<N ~= nx && 0..<M ~= ny &&
            graph[nx][ny] == 0 &&
            !isVisited[nx][ny] else { continue }
        dfs(x: nx, y: ny)
    }
}

var count: Int = 0
for i in 0..<N {
    for j in 0..<M {
        if isVisited[i][j] || graph[i][j] == 1 { continue }
        dfs(x: i, y: j)
        count += 1
    }
}

print(count)

*/

/*
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
*/



/*
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
*/

/*
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
*/

/*
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

*/

/*
var dp: [Int] = Array(repeating: 0, count: 100)

func fibo(n: Int) -> Int {
    if n == 1 || n == 2 { return 1 }

    if dp[n] != 0 { return dp[n] }

    dp[n] = fibo(n: n-1) + fibo(n: n-2) 
    return dp[n]
}

print(fibo(n: 99))
*/

/*
var dp: [Int] = Array(repeating: 0, count: 100)

dp[1] = 1
dp[2] = 1
let n: Int = 92

for i in 3..<n+1 { 
    dp[i] = dp[i-1] + dp[i-2]
}

print(dp[n])
print(dp)
*/

/*
let N: Int = Int(readLine()!)!

let storages: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

var dp: [Int] = Array(repeating: 0, count: N)
dp[0] = storages[0]
dp[1] = max(storages[0], storages[1])

for i:Int in 2..<N { 
    dp[i] = max(dp[i-1], dp[i-2]+storages[i])
}

print(dp[N-1])
*/

/*
let X: Int = Int(readLine()!)!

var dp: [Int] = Array(repeating: 0, count: X+1)

for i: Int in 2..<X+1 { 
    var nexts: [Int] = [dp[i-1]]
    if i % 5 == 0 { nexts.append(dp[i/5]) }
    if i % 3 == 0 { nexts.append(dp[i/3]) }
    if i % 2 == 0 { nexts.append(dp[i/2]) }
    dp[i] = nexts.min()! + 1
} 

print(dp[X])
print(dp)
*/

/*
let NM: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N: Int = NM[0]
let M: Int = NM[1]
var coins: [Int] = Array(repeating: 0, count: N)
var dp: [Int] = Array(repeating: -1, count: M+1)
dp[0] = 0
for i in 0..<N { 
    coins[i] = Int(readLine()!)!
}

for i in 1..<M+1 { 
    var nexts: [Int] = []
    for c in coins { 
        if i-c >= 0 && dp[i-c] != -1 { nexts.append(dp[i-c]) }
    }
    dp[i] = nexts.isEmpty ? -1 : nexts.min()!+1
}

print(dp[M])

*/

/*
let T: Int = Int(readLine()!)!

for _ in 0..<T {

    let nm: [Int] = readLine()!
        .split(separator: " ")
        .map { Int($0)! }

    let n: Int = nm[0]
    let m: Int = nm[1]
    var dp: [[Int]] = []

    let arr: [Int] = readLine()!
        .split(separator: " ")
        .map { Int($0)! }

    for i in 0..<n { 
        dp.append(Array(arr[i*m..<(i+1)*m]))
    }

    for j in 1..<m { 
        for i in 1..<n { 
            var leftUp: Int = 0
            var leftDown: Int = 0
            var left: Int = 0

            // 왼쪽위에서 오는 경우
            if i == 0 { leftUp = 0 }
            else { leftUp = dp[i-1][j-1] }

            // 왼쪽아래에서 오는 경우
            if i == n-1 { leftDown = 0 }
            else { leftDown = dp[i+1][j-1] }

            // 왼쪽에서 오는 경우
            left = dp[i][j-1]

            dp[i][j] = dp[i][j] + max(leftUp, leftDown, left)
        }
    }
    var result: Int = 0
    for i in 0..<n { 
        result = max(result, dp[i][m-1])
    }
    print(result)
}
*/

/*
let N: Int = Int(readLine()!)!
let soldiers: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
    .reversed()

var dp: [Int] = Array(repeating: 1, count: N)

for i in 1..<N { 
    for j in 0..<i { 
        if soldiers[j] < soldiers[i] { 
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}

print(N - dp.max()!)
*/

/*
let nm: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

// 노드의개수
let n: Int = nm[0]
// 간선의 개수
let m: Int = nm[1]

// 시작 노드 번호 입력받기
let start: Int = Int(readLine()!)!

var graph: [[Int]] = []
var isVisited: [Bool] = Array(repeating: false , count: n+1)
var distances: [Int] = Array(repeating: int.max, count: n+1)

// 간선 정보 입력받기
for _ in 0..<m { 
    let input = readLine()!
        .split(separator: " ")
        .map { Int($0)! }

    graph[]
}
*/

/*
func search(_ nums: [Int], _ target: Int) -> Int {
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

print(search([-1,0,3,5,9,12], 2))

*/

/*
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        
        var wIdx: Int = 0
        for i in 0..<nums.count { 
            if nums[i] != 0 {
                nums.swapAt(wIdx, i)
                wIdx += 1
            }
        }
    }
}
*/


/*
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
*/

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

print(minSubArrayLen(7, [2,3,1,2,4,3]))