import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var num: Int = 0
    var idx: Int = 0
    var answer: String = ""
    let p = p-1
    
    while answer.count < t {
        let newNum: [Character] = Array(String(num, radix: n))
        for c in newNum {
            if idx % m == p {
                let str = c.isLetter ? c.uppercased() : String(c)
                answer += str
            }
            if answer.count == t { break }
            idx += 1
        }
        num += 1
    }
    
    return answer
}
