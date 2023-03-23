# 다이나믹 프로그래밍 

- `메모리를 적절히 사용`하여 수행 시간 효율성을 비약적으로 향상시키는 방법이다.
- `이미 계산된 결과(작은 문제)는 별도의 메모리 영역에 저장`해 다시 계산하지 않도록 한다.
- 탑다운과 바텀업 방식이있다.

<br><br>

## 다이나믹 프로그래밍의 조건

### 최적 부분 구조(Optimal Substructure)

- 큰 문제를 작은 문제로 나눌 수 있으며 작은 문제의 답을 모아서 큰 문제를 해결할 수 있다.

### 중복되는 부분 문제(Overlapping Subproblem)

- 동일한 작은 문제를 반복적으로 해결해야 한다. 

<br><br>

## 메모이제이션(Memoization)
- 한 번 계산한 결과를 메모리 공간에 메모한다.
  - 같은 문제를 다시 호출하면 메모한 결과를 가져온다.
  - 캐싱(Caching)이라고도 한다.

<br><br>

## 피보나치 수열

### 탑다운

```swift
var dp: [Int] = Array(repeating: 0, count: 100)

func fibo(n: Int) -> Int {
    if n == 1 || n == 2 { return 1 }

    if dp[n] != 0 { return dp[n] }

    dp[n] = fibo(n: n-1) + fibo(n: n-2) 
    return dp[n]
}
```

<br>

## 바텀업
```swift
var dp: [Int] = Array(repeating: 0, count: 100)

dp[1] = 1
dp[2] = 1
let n: Int = 10

for i in 3..<n+1 { 
    dp[i] = dp[i-1] + dp[i-2]
}
```

### 시간복잡도

> O(N)


<br><br>

## 개미 전사

> n번째 항이 어떻게 만들어지는지 생각

```swift
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
```

<br><br>

## 1로 만들기

> 트리구조로 만들어서 더 작은 부분의 최적의 해 생각해서 조합

```swift
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
```

<br><br>

## 효율적인 화폐 구성

```swift
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
```

<br><br>

## 금광

```swift
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
```

<br><br>

## 병사 배치하기

```swift
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
```