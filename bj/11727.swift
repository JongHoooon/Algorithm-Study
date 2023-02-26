import Foundation 

let input = Int(readLine()!)!
var dp: [Int] = [-1, 1, 3]

print(solution(input))

func solution(_ n: Int) -> Int {
    if n == 1 || n == 2 {
        return dp[n]
    }

    for i in 3...n {
        dp.append((dp[i-1] + dp[i-2]*2) % 10007)
    }

    return dp[n]
}

