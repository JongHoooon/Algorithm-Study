import Foundation

/**
알파벳 소문자, 대문자, 숫자, 공백
*/



while let input = readLine(), !input.isEmpty   { 
    let charArr = Array(input)
    var smallLetterCount: Int = 0
    var largeLetterCount: Int = 0 
    var numberCount: Int = 0
    var spaceCount: Int = 0

    for c in charArr { 
        if c.isLowercase { 
            smallLetterCount += 1
            continue
        }
        if c.isUppercase { 
            largeLetterCount += 1
            continue
        }
        if c.isNumber { 
            numberCount += 1
            continue
        }
        if c.isWhitespace { 
            spaceCount += 1
            continue
        }
    }

    print("\(smallLetterCount) \(largeLetterCount) \(numberCount) \(spaceCount)")
}