import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    
    var answer: [[Int]] = []
    
    func isValidBuild(_ build: [Int]) -> Bool { 
        let x = build[0]
        let y = build[1]
        let a = build[2]
        
        switch a { 
        case 0: // 기둥
            guard y == 0 
                || answer.contains([x-1, y, 1]) 
                || answer.contains([x, y, 1]) 
                || answer.contains([x, y-1, 0]) else { return false }
            
        case 1: // 보
            guard answer.contains([x, y-1, 0]) 
                || answer.contains([x+1, y-1, 0]) 
                || (answer.contains([x-1, y, 1]) && answer.contains([x+1, y, 1])) else { return false }
        
        default:
            break
        }
        
        return true
    }
    
    for build in build_frame { 
        let x = build[0]
        let y = build[1]
        let a = build[2]
        let b = build[3]
        
        switch b { 
        case 0: // 삭제
            answer.removeAll { $0 == [x, y, a]}
            for build in answer { 
                if isValidBuild(build) == false { 
                    answer.append([x, y, a])
                    break
                }
            }
        case 1: // 설치
            if isValidBuild(build) == true { 
                answer.append([x, y, a])
            }
        default:
            break
        }
    }
    
    answer.sort { 
        if $0[0] != $1[0] { 
            return $0[0] < $1[0]
        } else if $0[0] == $1[0] && $0[1] != $1[1] { 
            return $0[1] < $1[1]
        } else { 
            return $0[2] < $1[2]
        }
    }
    
    return answer
}
