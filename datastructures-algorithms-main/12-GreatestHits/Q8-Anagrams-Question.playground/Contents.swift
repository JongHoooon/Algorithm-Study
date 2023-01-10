import UIKit

/*
   _
  /_\  _ _  __ _ __ _ _ _ __ _ _ __  ___
 / _ \| ' \/ _` / _` | '_/ _` | '  \(_-<
/_/ \_\_||_\__,_\__, |_| \__,_|_|_|_/__/
                |___/
 
 // Challenge: Given two strings, write an algorithm to detect whether one word is an anagram of the other.
 // An anagram is a word that can be made by changing the order of the letters in another word.
 //
 // For example:
 // tar => rat
 // state => taste

 */

func isAnagram(_ text: String, _ anagram: String) -> Bool {
    
    let textDict = makeCharCountDict(text)
    let anagrmaDict = makeCharCountDict(anagram)
    
    guard textDict.count == anagrmaDict.count else { return false }
    
    for (key, value) in textDict {
        if value != anagrmaDict[key] {
            return false
        }
    }
    return true
}

func makeCharCountDict(_ text: String) -> [Character: Int] {
    var chars = Array(text)
    var result = [Character: Int]()
    
    for c in chars {
        if result[c] == nil {
            result[c] = 1
        } else {
            result[c]! += 1
        }
    }
    return result
}


isAnagram("arc", "car")         // true
isAnagram("night", "thing")     // true
isAnagram("cat", "dog")         // false
