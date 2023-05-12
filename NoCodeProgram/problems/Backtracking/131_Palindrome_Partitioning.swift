
func partition(_ s: String) -> [[String]] {

    let s: [Character] = Array(s)
    if s.count == 0 { return [] }

    var result: [[String]] = []

    for i in 0..<s.count { 
        bt(begin: 0, last: i, letters: [])
    }

    func isPalindrome(begin: Int, last: Int) -> Bool { 
        var begin = begin
        var last = last
        while begin < last { 
            if s[begin] != s[last] { return false } 
            begin += 1
            last -= 1
        }
        return true
    }

    func bt(begin: Int, last: Int, letters: [[Character]]) {
        var letters = letters

        if !isPalindrome(begin: begin, last: last) { return }

        letters.append(Array(s[begin...last]))

        if s.count == last + 1 { 
            result.append(letters.map { String($0) })
            return
        }

        for idx in last+1..<s.count { 
            bt(begin: last+1, last: idx, letters: letters)
        }

        return
    }

    return result
}

print(partition("aabb"))