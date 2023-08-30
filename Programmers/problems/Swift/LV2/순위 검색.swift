import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    let info: [[String]] = info.map { 
        let info = $0
            .split(separator: " ")
            .map { String($0) }
        return info
    }
    let query: [[String]] = query.map { 
        let query = $0
            .split(separator: " ")
            .filter { $0 != "and" }
            .map { String($0) }
        return query
    }
    
    func filterApply(_ q: [String]) -> Int { 
        
        var filteredInfo: [[String]] = info
        
        for i in 0..<4 { 
            if q[i] == "-" { continue }
            
            filteredInfo = filteredInfo
                .filter { $0[i] == q[i] }
        }
        filteredInfo = filteredInfo
            .filter { Int($0[4])! >= Int(q[4])! }
        
        return filteredInfo.count
    }
    
    var answer: [Int] = []
    
    for q in query { 
        answer.append(filterApply(q))
    }
    
    return answer
}

func solution2(_ info:[String], _ query:[String]) -> [Int] {
    var db: [String: [Int]] = [:]
    var result: [Int] = []

    for i in info { 
        let arr = i.split(separator: " ")
        let languages = [arr[0], "-"]
        let jobs = [arr[1], "-"]
        let careers = [arr[2], "-"]
        let soulFoods = [arr[3], "-"]
        let score = Int(arr[4])!

        for language in languages { 
            for job in jobs { 
                for career in careers {
                    for soulFood in soulFoods {
                        let key = "\(language)\(job)\(career)\(soulFood)"
                        db[key, default: []].append(score)
                    }
                }
            }
        }
    }

    for i in db { 
        let sortArr = i.value.sorted()
        db[i.key] = sortArr
    }

    print(db)
    for i in query { 
        let arr = i.split(separator: " ")
        let key = "\(arr[0])\(arr[2])\(arr[4])\(arr[6])"
        let score = Int(arr[7])!

        if let scoreArr = db[key] { 
            var low = 0
            var high = scoreArr.count - 1
            var mid = 0

            while low <= high { 
                mid = (low + high) / 2
                if scoreArr[mid] < score { 
                    low = mid + 1
                } else { 
                    high = mid - 1
                }
            }
            result.append(scoreArr.count - low)
        } else { 
            result.append(0)
        }
    }

    return result
}

print(solution2(["java backend junior pizza 150", "python frontend senior chicken 210", "python frontend senior chicken 150", "cpp backend senior pizza 260", "java backend junior chicken 80", "python backend senior chicken 50"], ["java and backend and junior and pizza 100", "python and frontend and senior and chicken 200", "cpp and - and senior and pizza 250", "- and backend and senior and - 150", "- and - and - and chicken 100", "- and - and - and - 150"]))