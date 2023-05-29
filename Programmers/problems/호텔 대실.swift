import Foundation

func solution(_ book_time:[[String]]) -> Int {
    
    var bookTime: [[Int]] = book_time
        .map {
            let start = convertMin($0[0])
            let end = convertMin($0[1])
            
            return [start, end + 10]
        }

    bookTime.sort(by: { $0[0] < $1[0] })
    
    var answer: Int = 1
    
    for i in bookTime.indices.reversed() {
        var count: Int = 1
        for j in 0..<i {
            if bookTime[j][0]..<bookTime[j][1] ~= bookTime[i][0] { 
                count += 1
            }
        }
        answer = max(answer, count)
    }
    
    return answer
}

func convertMin(_ time: String) -> Int {
    let time = time
        .split(separator: ":")
        .map { Int($0)! }
    
    return time[0]*60 + time[1]
}

/*
1. 분 단위로 수정
2. 시작 시간 순서로 정렬
3. 시작 시작이 겹치는게 있는지 판단 n^2
*/