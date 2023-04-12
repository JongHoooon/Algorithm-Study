
func longestPalindrome(s: String) -> String {
    let strCount: Int = s.count
    let chars: [Character] = Array(s)
    var dp: [[Int]] = Array(
        repeating: Array(repeating: 0, count: strCount),
        count: strCount
    )

    for i in 0..<strCount { 
        dp[i][i] = 1
    }

    for i in 1..<strCount-1 { 
        dp[i][i+1] = 2
    }

    for i in 2..<strCount { 
        var row: Int = 0
        var col: Int = i
        while col < strCount { 
            let startChar: Character = chars[row]
            let endChar: Character =  chars[col]
            let prevCount: Int = dp[row+1][col-1]
            if startChar == endChar && prevCount != 0 { 
                dp[row][col] = prevCount + 2
            }
            row += 1
            col += 1
        }
    }

    var maxLength = 0 
    var startIdx = 0
    var endIdx = 0
    for row in 0..<strCount {
        for col in 0..<strCount { 
            let currentLength: Int = dp[row][col]
            if maxLength < currentLength {
                maxLength = currentLength
                startIdx = row
                endIdx = col
            }
        }
    }

    let subStr: String = String(chars[startIdx...endIdx])
    return subStr
}

print(longestPalindrome(s: "baabc"))