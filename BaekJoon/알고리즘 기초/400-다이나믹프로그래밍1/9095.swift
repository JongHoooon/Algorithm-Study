let T = Int(readLine()!)!
var dp: [Int] = [0, 1, 2, 4, 7]

for _ in 0..<T {
    let input = Int(readLine()!)!
    if 1...4 ~= input {
        print(dp[input])
        continue
    }

    if dp.count <= input { 
        for i in dp.count...input {
        dp.append(dp[i-1] + dp[i-2] + dp[i-3])
        }
        print(dp[input])
    } else {
        print(dp[input])
    }
}