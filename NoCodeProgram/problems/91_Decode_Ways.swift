
func numDecodings(_ s: String) -> Int {
    let chars: [Character] = Array(s)
    let strCount: Int = s.count
    if strCount == 0 { return 0 }

    var dp: [Int] = Array(repeating: -1, count: strCount+1)
    dp[strCount] = 1

    let lastChar: Character = chars[chars.count-1]
    if Int(String(lastChar))! == 0 { 
        dp[strCount-1] = 0
    } else { 
        dp[strCount-1] = 1
    }

    for i in stride(from: strCount-2, through: 0, by: -1) { 
        let singleNum: Int = Int(String(chars[i]))!
        let singleCount: Int = 0 < singleNum ? dp[i+1] : 0

        let doubleNum: Int = Int(String(chars[i+1]))! + singleNum * 10
        let doubleCount: Int = 10...26 ~= doubleNum ? dp[i+2] : 0

        dp[i] = singleCount + doubleCount
    }

    return dp[0]
} 

print(numDecodings("212325"))
