
func countSubstrings(_ s: String) -> Int {
    let s = Array(s)

    var dp = Array(
        repeatElement(Array(repeatElement(false, count: s.count)), 
        count: s.count)
    )
    var count = 0

    for i in 0..<s.count {
        dp[i][i] = true
        count += 1
    }

    for r in 1..<s.count { 
        for l in 0..<r { 
            if s[r] == s[l] && (dp[l+1][r-1] || r - l <= 2) { 
                dp[l][r] = true
                count += 1
            }
        }
    }

    return count
}

print(countSubstrings("ab"))