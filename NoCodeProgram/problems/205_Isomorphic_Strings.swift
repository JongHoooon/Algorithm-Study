
func isIsomorphic(_ s: String, _ t: String) -> Bool {
    let s: [Character] = Array(s)
    let t: [Character] = Array(t)
    var dict1: [Character: Character] = [:]
    var dict2: [Character: Character] = [:]

    for i in s.indices { 
        let character1 = dict1[s[i]]
        let character2 = dict2[t[i]]

        if character1 == nil && character2 == nil { 
            dict1[s[i]] = t[i]
            dict2[t[i]] = s[i]
            continue
        } else if character1 == t[i] && character2 == s[i] { 
            continue
        }

        return false
    }
    return true
}

print(isIsomorphic("foo", "bar"))