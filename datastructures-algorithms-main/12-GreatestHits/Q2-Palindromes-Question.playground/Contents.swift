import UIKit

/*
 ___ _      _ _         _
| _ \ |__ _| (_)_ _  __| |_ _ ___ _ __  ___ ___
|  _/ / _` | | | ' \/ _` | '_/ _ \ '  \/ -_|_-<
|_| |_\__,_|_|_|_||_\__,_|_| \___/_|_|_\___/__/

 // Challenge: Detect if a given string is a palindrome.
 // A palindrome is a word that can be spelt the same way forwards and backwards.

 */

func isPalindrome(_ text: String) -> Bool {
 
    /*
    let reversedChars = text.reversed()
    
    return text == String(reversedChars) ? true : false
    */
    let chars = Array(text)
    let length = text.count
    
    for i in 0..<length / 2 {
        if chars[i] != chars[length - i - 1] {
            return false
        }
    }
    return true
}

isPalindrome("abba")    // true
isPalindrome("mom")     // true
isPalindrome("dad")     // true
isPalindrome("radar")   // true
isPalindrome("rush")    // false
isPalindrome("yes")     // false
