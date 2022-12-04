import Foundation

/*
 When someone searches their contacts based on a phone number, it's nice when a list
 of contact pops up.
 
 Write an algorithm that searches your contacts for phone number strings, and returns:
  - NO CONTACT if contact can't be found
  - A contact if a contact is found
  - The first alphabetized contact if there are multiple
 
 A = ["pim", "pom"]             // Contacts (return one of these)
 B = ["999999999", "777888999"] // Phone numbers for each contact A[i] = B[i]
 P = "88999"                    // Search phrase

 Answer should be correct. Don't worry about performance.
 */

//public func solution(_ A : [String], _ B : [String], _ P : String) -> String {
//    // do your work here
//
//    var selectedContact: String?
//    for contact in B {
//        if contact.localizedStandardContains(P) == true {
//            selectedContact = contact
//            break
//        }
//    }
//
//    var result: String = ""
//
//    guard let contact = selectedContact else { return "NO CONTACT" }
//    let index = B.firstIndex { str in
//        str == contact
//    }
//    result = A[index!]
//
//
//    return result
//}

public func solution(_ A : [String], _ B : [String], _ P : String) -> String {
    var result = [String]()
      
    // loop through looking for match - when found add to result
    for i in 0..<B.count {
        if B[i].contains(P) {
            result.append(A[i])
        }
    }
    
    if result.count == 0 {
        return "NO CONTACT"
    } else if  result.count == 1 {
        return result.first!
    }
    
    return result.sorted().first!
}

let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"

solution(A, B, P)   // pom
solution(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")  // ann
solution(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112")   // NO CONTACT

// edge cases
solution([String](), [String](), "")
solution(A, B, "")

public func solutionDict(_ A : [String], _ B : [String], _ P : String) -> String {
    // 🕹 Game on here
    return ""
}



