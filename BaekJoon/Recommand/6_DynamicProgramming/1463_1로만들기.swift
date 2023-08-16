var n = Int(readLine()!)!

/*
var dp = [Int](repeating: 0, count: n+1)

for i in 2..<n+1 { 
    dp[i] = dp[i-1] + 1
    if i % 3 == 0 { 
        dp[i] = min(dp[i], dp[i/3]+1)
    }
    if i % 2 == 0 { 
        dp[i] = min(dp[i], dp[i/2]+1)
    }
}

print(dp[n])
*/

var dp = [Int](repeating: -1, count: n+1)

func topDown(_ n: Int) -> Int { 

    if dp[n] != -1 { 
        return dp[n]
    }

    if n == 1 { 
        dp[1] = 0 
        return 0
    } 
    if n == 2 { 
        dp[2] = 1 
        return 1
    }
    if n == 3 { 
        dp[3] = 1 
        return 1
    } 

    var counts = [topDown(n-1)+1]
    if n % 3 == 0 { 
        counts.append(topDown(n/3)+1)
    }
    if n % 2 == 0 { 
        counts.append(topDown(n/2)+1)
    }

    dp[n] = counts.min()!
    return dp[n]
} 

print(topDown(n))