
import Foundation

func solution(_ n:Int, _ k:Int) -> Int {

    let nums: [Int] = String(n, radix: k)
        .split(separator: "0")
        .map { Int($0)! }

    let answer = nums
        .filter { isPrime($0) }
        .count

    return answer
}

func isPrime(_ num: Int) -> Bool {
    if num == 1 { return false }
    if num == 2 || num == 3 { return true }

    for n in 2...Int(sqrt(Double(num))) {
        if num % n == 0 {
            return false
        }
    }

    return true
}

/*
String -> Int로 바꾸는 과저에서 over flow 발생할 수 있다. 조심

진법 바꾸는법 체크 
*/

