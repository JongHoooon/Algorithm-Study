import Foundation

private func getDate(_ date: String) -> [Int] {
    return date
        .split(separator: ".")
        .map { Int($0)! }
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var termsDict: [String: Int] = [:]
    var today = getDate(today)
    
    for term in terms { 
        let term = term.split(separator: " ")
        termsDict[String(term[0])] = Int(term[1])!
    }
    
    func isValid(_ privacy: String) -> Bool { 
        let privacy = privacy
            .split(separator: " ")
            .map { String($0) }
        
        var date = getDate(privacy[0])
        let term = termsDict[privacy[1], default: 0]
        
        // 일 == 1 인경우
        if date[2] == 1 { 
            date[1] -= 1
            date[2] = 28
        } else {
            date[2] -= 1
        }
        
        // 월 > 13 인경우
        date[1] += term
        if date[1] > 12 { 
            let m = date[1]
            date[1] = m % 12 == 0 ? 12 : m % 12
            date[0] += m % 12 == 0 ? m / 12 - 1 : m / 12
        }

        if date[0] < today[0] { return false }
        if date[0] == today[0] && date[1] < today[1] { return false }
        if date[0] == today[0] && date[1] == today[1] && date[2] < today[2] { return false }
        
        return true
    }
    
    var answer: [Int] = []
    for (i, privacy) in privacies.enumerated() { 
        if isValid(privacy) == false { 
            answer.append(i+1)
        }
    }
    
    return answer
}

/*-------------------------------------------------------------------------------------*/

func countDate(_ date: String) -> Int { 
    let date = date.components(separatedBy: ".")
    return Int(date[0])!*12*28 + Int(date[1])!*28 + Int(date[2])!
}

func solution2(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let today = countDate(today)
    var termsDict: [String: Int] = [:]
    
    for t in terms { 
        let t = t.components(separatedBy: " ")
        termsDict[t[0]] = Int(t[1])!
    }
    
    func checkValidity(_ privacy: String) -> Bool { 
        let privacy = privacy.components(separatedBy: " ")
        let term = termsDict[privacy[1], default: 0]
        let date = countDate(privacy[0]) + term*28
        
        return date > today
    }
    
    var answer: [Int] = []
    for (i, p) in privacies.enumerated() { 
        if checkValidity(p) == false { 
            answer.append(i+1)
        }
    }
    
    return answer
}