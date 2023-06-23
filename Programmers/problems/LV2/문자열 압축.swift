import Foundation

func solution(_ s:String) -> Int {
    
    var temp1: [Character] = []
    var temp2: [Character] = []
    
    let  s: [Character] = Array(s)
    
    var answer: Int = Int.max
        
    for i in 1...s.count {
        
        var temp: String = ""
        var cuts: [String] = []
        for c in s { 
            if temp.count == i { 
                cuts.append(String(temp))
                temp = ""
            }
            temp += String(c)
        }
        if !temp.isEmpty { 
            cuts.append(String(temp))
        }
        
        var compression: String = ""
        var count: Int = 1
        for i in 1..<cuts.count { 
            if cuts[i-1] == cuts[i] { 
                count += 1 
            } else { 
                compression += cuts[i-1]
                if count != 1 { 
                    compression += String(count)
                    count = 1
                }
            }
        }
        compression += cuts.last ?? ""
        if count != 1 { 
            compression += String(count)
            count = 1
        }
        if compression.count < answer { 
            answer = compression.count
        }
    }
    
    return answer
}