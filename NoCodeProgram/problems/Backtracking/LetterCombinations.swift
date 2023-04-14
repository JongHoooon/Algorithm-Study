
func solutions(digits: String) -> [String] {
    let keypad: [String] = [
        "",
        "",
        "abc",
        "def",
        "ghi",
        "jkl",
        "mno",
        "pqrs",
        "tuv",
        "wxyz"
    ]
    if digits.count == 0 { return [] }

    var comb: [String] = []
    BT(index: 0, crntStr: [])
    return comb

    func BT(index: Int, crntStr: [Character]) { 
        var crntStr = crntStr
        if index == digits.count { 
            let newComb = String(crntStr)
            comb.append(newComb)
            return
        }

        let num: Int = Int(String(Array(digits)[index]))!
        let chars: String = keypad[num]
        for char in chars { 
            crntStr.append(char)
            BT(index: index+1, crntStr: crntStr)
            crntStr.removeLast()
        }
    }
}

print(solutions(digits: "259"))