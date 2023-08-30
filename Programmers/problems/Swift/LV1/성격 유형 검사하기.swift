import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    var scoreDict: [Character: Int] = [:]
    
    for (i, s) in survey.enumerated() { 
        let s = Array(s)
        let score = choices[i] - 4
        if score > 0 { 
            scoreDict[s[1], default: 0] += score
        } else if score < 0 { 
            scoreDict[s[0], default: 0] += score * -1
        }
    }
    
    var answer = ""
    
    answer += scoreDict["R"] ?? 0 >= scoreDict["T"] ?? 0 ? "R" : "T"
    answer += scoreDict["C"] ?? 0 >= scoreDict["F"] ?? 0 ? "C" : "F"
    answer += scoreDict["J"] ?? 0 >= scoreDict["M"] ?? 0 ? "J" : "M"
    answer += scoreDict["A"] ?? 0 >= scoreDict["N"] ?? 0 ? "A" : "N"
    
    return answer
}