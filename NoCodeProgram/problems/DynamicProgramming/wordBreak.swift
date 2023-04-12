
func wordBreak(s: String, wordDict: [String]) -> Bool { 
    let chars: [Character] = Array(s)
    let wordSet: Set<String> = Set(wordDict)

    let strCount: Int = s.count
    var dp: [Bool] = Array(repeating: false, count: strCount)
    dp[0] = true

    for idx in 1..<strCount { 
        for word in wordSet { 
            let wordLength: Int = word.count
            let prevIdx: Int = idx - wordLength
            
            if prevIdx < 0 { continue }
            if !dp[prevIdx] { 

                continue 
            }

            if String(chars[prevIdx..<idx]) == word {
                dp[idx] = true
                break
            }
        }
    }
    return dp.last!
}

print(wordBreak(s: "nocodeprogram", wordDict: ["noc","cod","code","program"]))
print(wordBreak(s: "nocope", wordDict: ["e","no","cop"]))