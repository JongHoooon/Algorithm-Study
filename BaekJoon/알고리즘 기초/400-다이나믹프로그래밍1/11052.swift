import Foundation

let N = Int(readLine()!)!
let cards = readLine()!.components(separatedBy: " ").map { Int($0)! }
var dp = [Int](repeating: 0, count: N+1)

for i in 1..<N+1 { 
    for j in 1..<i+1 { 
        dp[i] = max(dp[i], dp[i-j]+cards[j-1])
    }
}

print(dp[N])








/*
4: 7
3 + 1: 6 + 1
2 + 2: 5 + 5
2 + 1 + 1: 5 + 1 + 1
1 + 1 + 1 + 1: 1 + 1 + 1 + 1

1 - 1
2 - 5
3 - 6, 6
4 - 7, 7, 5+5
*/