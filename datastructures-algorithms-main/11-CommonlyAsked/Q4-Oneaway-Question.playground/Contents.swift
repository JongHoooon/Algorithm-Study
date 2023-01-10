import UIKit

/*
 ___
/ _ \ _ _  ___ __ ___ __ ____ _ _  _
|(_) | ' \/ -_) _` \ V  V / _` | || |
\___/|_||_\___\__,_|\_/\_/\__,_|\_, |
                                |__/

  Challenge: There are three types of edits that can be performed on strings:
  - insert a character
  - remove a character, or
  - replace a character.
 
  Given two strings, write a function to check if they are one or zero edits away.

 */

func oneAway(_ first: String, _ second: String) -> Bool {
    if abs(first.count - second.count) > 1 {
        return false
    } else if first.count == second.count {
        return oneEditReplace(first, second)
    } else if first.count + 1 == second.count {
        return oneEditInsert(first, second)
    } else if first.count - 1 == second.count {
        return oneEditInsert(second, first)
    }
    
    return false
}

func oneEditReplace(_ first: String, _ second: String) -> Bool {
    let firstChars = Array(first)
    let secondChars = Array(second)
    var count = 0
    for i in 0..<first.count {
        if firstChars[i] != secondChars[i] {
            count += 1
        }
    }
    return count > 1 ? false : true
}


/// oneEditInsert
/// - Parameters:
///   - s1: 짧은거
///   - s2: 긴거
/// - Returns: 결과
func oneEditInsert(_ s1: String, _ s2: String) -> Bool {
    var i = 0
    var j = 0
    
    let s1Chars = Array(s1)
    let s2Chars = Array(s2)
    
    while i < s1.count && j < s2.count {
        if s1Chars[i] != s2Chars[j] {
            if i != j {
                return false
            }
            j += 1
        } else {
            i += 1
            j += 1
        }
    }
    return true
}


oneAway("pale", "paleXXXX")     // false
oneAway("pale", "ple")          // true
oneAway("pales", "pale")        // true
oneAway("pale", "bale")         // true
oneAway("pale", "bake")         // false
oneAway("pale", "bakeerer")     // false
