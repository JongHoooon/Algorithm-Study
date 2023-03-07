//
//  main.swift
//  마법의 엘리베이터
//
//  Created by JongHoon on 2023/03/07.
//

import Foundation

/*
func solution(_ storey:Int) -> Int {
    var storey = storey
    var count: Int = 0
    
    while storey != 0 {
        let n = storey % 10
        
        if n >= 6 {
            storey += 10 - n
            count += 10 - n
        } else if n == 5 && (storey / 10) % 10 >= 5 {
            storey += 10 - n
            count += 10 - n
        } else {
            count += n
        }
        storey /= 10
    }
    
    return count
}
 */

// BFS
func solution(_ storey:Int) -> Int {
    var answer: Int = Int.max
    
    func dfs(storey: Int) {
        var queue: [(Int, Int)] = [(storey, 0)]
        
        while !queue.isEmpty {
            let (storey, count) = queue.removeLast()
            if storey < 10 {
                answer = min(answer, count + storey, count + 10 - storey + 1)
                continue
            }
            
            let n = storey % 10
            queue.append((storey / 10, count+n))
            queue.append((storey / 10 + 1, count+10-n))
        }
    }
    dfs(storey: storey)
    return answer
}



print(solution(2554))
print(solution(2673))
print(solution(9999))

print(solution(155))
print(solution(154))
print(solution(85))

/*
 155
 
 
 
 
 */



/*
 
 2554
 
 -1000 - 2
 -100  - 5
 -10   - 5
 -1    - 4
 */

/*
 
2673
 
 -1000 - 2
 -100  - 6
 -10   - 7
 -1    - 3
 
 -1000 - 3
 +100  - 3
 +10   - 3
 -1    - 3
 
*/

/*
 16
 
 -10 - 1
 -1  - 6
 
 -10 - 2
 +1  - 4
 */
