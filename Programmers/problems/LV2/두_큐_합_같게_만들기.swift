
import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let target: Int = (queue1.reduce(0, +) + queue2.reduce(0, +)) / 2
    
    let queue = queue1 + queue2
    var i = 0
    var j = queue1.count - 1
    var sum = queue1.reduce(0, +)
    var answer = 0
    
    while i <= j && j < queue.count - 1 {
        if sum == target { 
            return answer
        } else if sum > target { // pop
            sum -= queue[i]
            i += 1
        } else if sum < target { // insert
            j += 1
            sum += queue[j]
        }
        answer += 1
    } 
    
    return -1
}
