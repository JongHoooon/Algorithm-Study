//
//  main.swift
//  체육복
//
//  Created by JongHoon on 2023/01/11.
//

import Foundation

//func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
//    var checkArray = Array(repeating: 1, count: 5)
//
//    for i in lost {
//        checkArray[i - 1] -= 1
//    }
//    for i in reserve {
//        checkArray[i - 1] += 1
//    }
//
//    var count = 0
//    for i in 0..<n {
//        if checkArray[i] == 0 {
//            if i > 0 && checkArray[i-1] > 1 {
//                checkArray[i] = 1
//                checkArray[i-1] -= 1
//            } else if i < n-1 && checkArray[i+1] > 1 {
//                checkArray[i] = 1
//                checkArray[i+1] -= 1
//            } else {
//                count += 1
//            }
//        }
//    }
//    return n - count
//}



/*
 
import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    // lost와 중복이 없는
    let newReserve = reserve.filter { !lost.contains($0) }
    let newLost = lost.filter { !reserve.contains($0) }

    var lostPeople: Int = newLost.count

    newReserve.forEach {
        let isLend: Bool = newLost.contains($0 - 1) || newLost.contains($0 + 1)
        if isLend && lostPeople > 0 {
            lostPeople -= 1
        }
    }

    return n - lostPeople
}

 */



//func solution(_ numbers:[Int]) -> [Int] {
//    var answer: [Int] = Array(repeating: -1, count: numbers.count)
//    var stack: [(Int, Int)] = [(1, 1)]
//
//    print(stack[0].0)
//
////     for (i, num) in numbser.enumerated() {
////         if !stack.isEmpty {
////             while !stack.isEmpty && stack.values[] < num {
////                 asnwer =
////             }
//
////         }
//
////         stack.updateValue(num, forKey: i)
////     }
//
////     stack.updateValue(1, forKey: 1)
////     print(stack)
//
//    return []
//}


//func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
//    let dict: [String: Int] = terms.reduce(into: [String: Int]()) { $0.components(separatedBy: " ")[0]: Int($0.components(separatedBy: " ")[1])! }
//
//    print(dict)
//
//    return []
//}
//

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var k: Int = k
    var n: Int = n
    var clear: [Int] = []
    var count: Int = 0
    
    
    for e in enemy {
        if n >= e {
            n -= e
        } else if k != 0  {
            
            let max = clear.max()!
            
            if max > e {
                n += max - e
                clear.remove(at: clear.firstIndex(of: max)!)
            }
            k -= 1
        } else {
            break
        }
        count += 1
    }
    
    
    return count
}


print(solution(7, 3, [4, 2, 4, 5, 3, 3, 1]))
