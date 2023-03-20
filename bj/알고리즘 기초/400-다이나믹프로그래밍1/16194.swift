
let N: Int = Int(readLine()!)!
let cards: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
var dp: [Int] = Array(repeating: Int.max, count: N+1)
dp[0] = 0

for i in 1..<N+1 {
    for j in 1..<i+1 { 
        dp[i] = min(dp[i], dp[i-j]+cards[j-1])
    }
}

print(dp.last!)


/*

1: 1
2: 1+1
3: 1+1+1, 6
4: 4, 7

1

1+1
2

1+1+1
1+2
3

1+1+1+1
1+1+2
1+3

2+2

*/
