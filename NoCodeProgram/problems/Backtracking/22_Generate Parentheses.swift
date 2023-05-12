
func generateParenthesis(_ n: Int) -> [String] {

    let openCount: Int = n
    let closeCount: Int = n

    var result: [String] = []

    bt(openCount: openCount, closeCount: closeCount, letters: "")

    func bt(openCount: Int, closeCount: Int, letters: String) {

        if openCount == 0 && closeCount == 0 {
            result.append(letters)
            return
        }

        // open whenever we have open 
        if 0 < openCount { 
            bt(openCount: openCount-1, closeCount: closeCount, letters: letters + "(")
        }

        // close when we cannot open
        if openCount < closeCount { 
            bt(openCount: openCount, closeCount: closeCount-1, letters: letters+")")
        }
    }

    return result
}

print(generateParenthesis(4))