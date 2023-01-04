import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reverses the String
 using a stack.
 */

func solution(_ text: String) -> String {
    var textArray = Array(text).reversed()
//    var result = [Character]()
    
//    for i in textArray {
//        result.append(<#T##newElement: Character##Character#>)
//    }
    
     
    
    return String(textArray)
}

solution("abc") // cba
solution("Would you like to play a game?")
