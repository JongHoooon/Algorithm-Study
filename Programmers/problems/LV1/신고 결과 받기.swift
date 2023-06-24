import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reportDict: [String: Set<String>] = [:]
    var resultDict: [String: Int] = [:]
    
    for r in report { 
        let r: [String] = r
            .components(separatedBy: " ")
        
        reportDict[r[1], default: []].insert(r[0])
    }
    
    for (key, value) in reportDict { 
        if value.count >= k { 
            for id in value { 
                resultDict[id, default: 0] += 1
            }
        }
    }   
    
    var answer: [Int] = []
    for id in id_list { 
        answer.append(resultDict[id] ?? 0)
    }
    
    return answer
}

/*
중복을 제거한다 -> set
처음에 report를 set 처리해서 하면 신고 중복을 전부 제거할 수 있다.
*/