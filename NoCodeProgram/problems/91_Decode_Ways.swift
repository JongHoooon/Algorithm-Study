
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

    return 0
}