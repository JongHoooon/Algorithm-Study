import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    var inTimeDict: [Int: Int] = [:]
    var parkTimeDict: [Int: Int] = [:]
    
    for record in records { 
        let record = record
            .split(separator: " ")
            .map { String($0) }
        
        let time = toMin(record[0])
        let num = Int(record[1])!
        let type = record[2]
        
        if type == "IN" {
            inTimeDict[num, default: 0] = time
            continue
        }
        
        if type == "OUT" {
            let time = time - inTimeDict[num, default: 0]
            parkTimeDict[num, default: 0] += time
            inTimeDict.removeValue(forKey: num)
            continue
        }
    }
    
    for inTime in inTimeDict {
        let time = toMin("23:59") - inTime.value
        parkTimeDict[inTime.key, default: 0] += time
    }
    
    func countFee(_ time: Int) -> Int {
        if time <= fees[0] { return fees[1] }
        
        return fees[1] + Int(ceil(Float(time - fees[0]) / Float(fees[2]))) * fees[3] 
    }
        
    let nums = parkTimeDict.keys.sorted(by: <)
    var answer: [Int] = []
    
    for num in nums { 
        let fee = countFee(parkTimeDict[num, default: 0])
        answer.append(fee)
    }
    
    return answer
}

func toMin(_ time: String) -> Int {
    let time = time
        .split(separator: ":")
        .map { Int($0)! }
    
    return time[0] * 60 + time[1]
}


/*
소숫점 올림

2. 시간 정리

[번호: 들어간 시간]
[번호: 총시간]

3. 시간 -> 요금 계산
*/