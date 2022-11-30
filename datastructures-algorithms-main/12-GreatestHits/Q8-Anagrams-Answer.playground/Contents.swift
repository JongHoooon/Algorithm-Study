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

/*
 We could create a Dictionary of each word, and do a count comparison
 like we did in ransom note. Or, we could note that two sorted String
 equal to each other would also be anagrams.
 */

func isAnagram(_ text: String, _ anagram: String) -> Bool {
    let chars1 = Array(text).sorted()
    let chars2 = Array(anagram).sorted()
    
    return chars1 == chars2
}

isAnagram("arc", "car")         // true
isAnagram("night", "thing")     // true
isAnagram("cat", "dog")         // false
