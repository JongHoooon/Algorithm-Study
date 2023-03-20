//
//  main.swift
//  덧칠하기
//
//  Created by JongHoon on 2023/03/04.
//

//import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var section: [Int] = section
    var answer: Int = 0

    while !section.isEmpty {
        answer += 1
        let first = section.removeFirst()
        for wall in section {
            if wall < first + m {
                let _ = section.removeFirst()
            } else {
                break
            }
        }
    }

    return answer
}

print(solution(4, 1, [1,2,3,4]))

    
    
    
    
    
    

/*
func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var section = section
    var count: Int = 0
    var isFirst: Bool = true
    
    while !section.isEmpty {
        if isFirst {
            let wall = section[0]
            for _ in 0..<m {
                guard let first = section.first else { break }
                if first < wall + m {
                    let _ = section.removeFirst()
                } else {
                    break
                }
            }
        } else {
            let wall = section.last!
            for _ in 0..<m {
                guard let last = section.last else { break }
                if last > wall - m {
                    let _ = section.removeLast()
                } else {
                    break
                }
            }
        }
        count += 1
        isFirst.toggle()
    }
    return count
}
*/

/*
func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var section = section
    var count = 0
    
    while !section.isEmpty {
        let wall = section[0]
        for _ in 0..<m {
            guard let first = section.first else { break }
            if first < wall + m {
                let _ = section.removeFirst()
            } else {
                break
            }
        }
        count += 1
    }
    return count
}
*/
