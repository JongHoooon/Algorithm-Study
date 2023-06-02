//
//  main.swift
//  숫자 카드 나누기
//
//  Created by JongHoon on 2023/03/07.
//

import Foundation

/*
func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let arrayA = arrayA.sorted()
    let arrayB = arrayB.sorted()
    var answer: Int = Int.min
    
    let gcdA: Int = arrayA.reduce(arrayA[0], {
        getGcd($0, $1)
    })
    
    let gcdB: Int = arrayB.reduce(arrayB[0], {
        getGcd($0, $1)
    })
    
    if gcdA == 1 && gcdB == 1 { return 0 }
    
    if gcdA != 1 {
        var divisorArrA: [Int] = []
        for i in 1...Int(sqrt(Double(gcdA))) {
            if gcdA % i == 0 {
                divisorArrA.append(i)
                divisorArrA.append(gcdA/i)
            }
        }
        divisorArrA.sort(by: >)
        
    loop1: for d in divisorArrA {
            var isDivided: Bool = false
            for n in arrayB {
                if n % d == 0 { isDivided = true}
            }
            if !isDivided {
                answer = d
                break loop1
            }
        }
    }
    
    if gcdB != 1 {
        var divisorArrB: [Int] = []
        for i in 1...Int(sqrt(Double(gcdB))) {
            if gcdB % i == 0 {
                divisorArrB.append(i)
                divisorArrB.append(gcdB/i)
            }
        }
        divisorArrB.sort(by: >)
        
    loop2: for d in divisorArrB {
            var isDivided: Bool = false
            for n in arrayA {
                if n % d == 0 { isDivided = true}
            }
            if !isDivided {
                if d > answer {
                    answer = d
                }
                break loop2
            }
        }
    }
    
    return answer == Int.min ? 0 : answer
}


func getGcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return getGcd(b, a % b)
}
*/

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    let gcdA = gcd(arrayA)
    let gcdB = gcd(arrayB)
    let answerA = arrayB.allSatisfy { gcdA != 1 && $0 % gcdA != 0 } ? gcdA : 0
    let answerB = arrayA.allSatisfy { gcdB != 1 && $0 % gcdB != 0 } ? gcdB : 0
        
    return max(answerA, answerB)
}

func gcd(_ arr: [Int]) -> Int {
    return arr.reduce(arr[0], { gcd($0, $1) })
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a % b)
}


print(solution([10, 10, 20], [5, 17]))
//print(solution([10, 20], [5, 17]))
//print(solution([14, 35, 119], [18, 30, 102]))
