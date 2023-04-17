
func restoreIpAddresses(_ s: String) -> [String] {
    let chars: [Character] = Array(s)

    func valid(numChars: [Character]) -> Bool { 
        if numChars.count == 1 {
            return true
        }
        if numChars[0] == "0" {
            return false
        }
        if 255 < Int(String(numChars))! {
            return false
        }
        return true
    }

    func BT(_ idx: Int, IPs: [String]) {
        var IPs = IPs

        // Exit Condition
        if 4 < IPs.count { return }
        else if idx == chars.count && IPs.count == 4 {
            let IP: String = IPs.joined(separator: ".") 
            answer.append(IP)
            return 
        }

        let charsCount: Int = chars.count
        let idxP3: Int = idx + 3
        var num: [Character] = [] 

        // Candiates Filtering
        for i in idx..<min(idxP3, charsCount) { 
            num.append(chars[i])
            if valid(numChars: num) { 
                IPs.append(String(num))

                // Recursive Call
                BT(idx+num.count, IPs: IPs)
                let _ = IPs.removeLast()
            }
        }
        return
    }

    var answer: [String] = []
    BT(0, IPs: [])
    return answer
}

print(restoreIpAddresses("200023125"))

print(restoreIpAddresses("222523125"))