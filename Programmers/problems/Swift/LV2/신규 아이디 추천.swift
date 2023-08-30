import Foundation

func solution(_ new_id:String) -> String {
    
    var newID: [Character] = Array(new_id)
    let forbiddenLetters: [Character] = Array("~!@#$%^&*()=+[{]}:?,<>/")
    
    // step 1 O(n)
    for (i, c) in newID.enumerated() { 
        if c.isLetter { 
            newID[i] = Character(c.lowercased())
        }
    }
    
    // step 2 O(n)
    newID = newID.filter { !forbiddenLetters.contains($0) }
    
    // step 3 O(n)
    var newID2: [Character] = []
    for (i, c) in newID.enumerated() {
        if i != newID.count-1 && c == "." && newID[i+1] == "." { continue }
        newID2.append(c)
    }
    
    // setp 4 O(n)
    if newID2.first == "." { _ = newID2.removeFirst() }
    if newID2.last == "." { _ = newID2.removeLast() }
    
    
    // step 5 O(1)
    if newID2.isEmpty { newID2.append("a") }
    
    // step 6 O(n)
    if newID2.count >= 16 {
        newID2 = Array(newID2[0...14])
        if newID2.last == "." { _ = newID2.removeLast() }
    }
    
    // step 7 O(1)
    if newID2.count <= 2 { 
        let n = 3 - newID2.count 
        let c = newID2.last!
        for _ in 0..<n { 
            newID2.append(c)
        }
    }
        
    return String(newID2)
}