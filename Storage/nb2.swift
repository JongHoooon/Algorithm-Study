
import Foundation 

func solution(_ arr: [String]) -> String {

    var current: [Character] = []
    var idx: Int = 0
    var answer: String = ""
    var byteCount: Int = 0
    
    for (i, str) in arr.enumerated() {
        switch str { 
            case "BOOL":
                if current.isEmpty == true { 
                    current = Array("#.......")
                    idx = 1
                    continue
                }
                if idx < 7 { 
                    current[idx] = "#"
                    idx += 1
                } else {
                    addCurrent()
                    current = Array("#.......")
                    idx = 1
                }

            case "SHORT":
                if current.isEmpty == true { 
                    current = Array("##......")
                    idx = 2
                    continue
                }
                
                if 1...7 ~= i && arr[i-1] == "BOOL" { 
                    idx += 1
                }

                if idx < 6 { 
                    for _ in 0..<2 { 
                        current[idx] = "#"
                        idx += 1
                    }
                } else {
                    addCurrent()
                    current = Array("##......")
                    idx = 2
                }

            case "FLOAT":
                if current.isEmpty == true { 
                    current = Array("####....")
                    idx = 4
                    continue
                }

                if 1...7 ~= i && arr[i-1] == "BOOL" { 
                    idx += 1
                }

                if idx < 4 { 
                    for _ in 0..<4 { 
                        current[idx] = "#"
                        idx += 1
                    }
                } else {
                    addCurrent()
                    current = Array("####....")
                    idx = 4
                }    

            case "INT":
                if current.isEmpty == false { 
                    addCurrent()
                }
                answer += "########,"
                byteCount += 8
            case "LONG":
                if current.isEmpty == false {    
                    addCurrent()
                }
                answer.append("########,")
                answer.append("########,")
                byteCount += 16
            default:
                break   
        }
        if byteCount > 128 { break }
    }

    if current.isEmpty == false { 
        addCurrent()
    }

    var temp = Array(answer)
    _ = temp.removeLast() 
    answer = String(temp)


    func addCurrent() { 
        answer.append(String(current+","))
        current = []
        idx = 0
        byteCount += 8
    }

    return byteCount > 128 ? "HALT" : answer
}

print(solution(["INT","INT","BOOL","SHORT","LONG"]))
print(solution(["INT","SHORT","FLOAT","INT","BOOL"]))
print(solution(["BOOL","LONG","SHORT","LONG","BOOL","LONG","BOOL","LONG","SHORT","LONG","LONG"]))










/*
Bool  1
short 2
float 4
int   8
long  16

*/