
func solution1(_ n:Int, _ info:[Int]) -> [Int] {
    let scores = Array((0...10).reversed())
    
    var scoreCount: Int = 0
    var result: [Int] = [-1]
    let shots: [Int] = Array(repeating: 0, count: info.count)
    
    func dfs(_ idx: Int, _ count: Int, _ shots: [Int]) {
        var shots = shots
        shots[idx] += 1
        if count == n {
            let score = countScore(shots)
            print(shots, score)
            
            if score != 0 && score == scoreCount {
                for i in (0..<info.count).reversed() {
                    guard shots[i] != 0 || result[i] != 0 else { continue }
                    guard shots[i] != result[i] else { continue }
                    
                    if shots[i] > result[i] {
                        result = shots
                        break
                    } else {
                        break
                    }
                }
            } else if score > scoreCount{
                scoreCount = score
                result = shots
            }
        
            return
        }
        
        for i in idx..<info.count {
            dfs(i, count + 1, shots)
        }
    }
    
    func countScore(_ shots: [Int]) -> Int {
        var aScore: Int = 0
        var lScore: Int = 0
        for i in 0..<info.count {
            
            if info[i] == 0 && shots[i] == 0 {
                continue
            }
            
            let score = scores[i]
            if info[i] >= shots[i] {
                aScore += score
            } else {
                lScore += score
            }
        }
        
        return lScore - aScore
    }
    
    for i in 0..<info.count {
        dfs(i, 1, shots)
    }
    
    return result
}


/*-----------------------------------------------------------*/

var apichArray: [Int] = Array(repeating: 0, count: 11)
var lionArray: [Int] = Array(repeating: 0, count: 11)
var answer = [-1]
var maxScore = 0 

func calculateScore() {
    var lionScore = 0
    var apichScore = 0

    for idx in 1...10 {
        if apichArray[idx] == 0 && lionArray[idx] == 0 {
            continue
        }

        if lionArray[idx] > apichArray[idx] {
            lionScore += idx
        } else {
            apichScore += idx
        }
    }

    if lionScore - apichScore > maxScore { 
        maxScore = lionScore - apichScore
        answer = lionArray
    }
}

func bruteForce(_ previousIdx: Int, _ remainArrow: Int) {
    if remainArrow == 0 {
        calculateScore()
        return
    }

    if previousIdx == 10 { 
        return
    }

    for nextIdx in previousIdx + 1...10 {
        for arrow in 0...remainArrow { 
            lionArray[nextIdx] = remainArrow - arrow
            print(nextIdx, lionArray)
            bruteForce(nextIdx, arrow)
            lionArray[nextIdx] = 0
        }
    }
}

func solution2(_ n:Int, _ info:[Int]) -> [Int] {
    apichArray = info.reversed() // 점수 오름차순으로 변경
    bruteForce(-1, n)
    return answer.reversed()
}

print(solution2(5, [2,1,1,1,0,0,0,0,0,0,0]))
