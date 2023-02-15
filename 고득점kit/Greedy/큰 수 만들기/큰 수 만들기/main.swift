//
//  main.swift
//  큰 수 만들기
//
//  Created by JongHoon on 2023/01/18.
//

import Foundation


//func solution(_ number: String, _ k: Int) -> String {
//    let number = number.map { String($0) }
//    var stack = [String]()
//    var count = 0
//
//    for i in 0..<number.count {
//        while count < k &&
//                !stack.isEmpty &&
//                stack.last! < number[i] {
//            stack.removeLast()
//            count += 1
//        }
//        if count >= k {
//            stack.append(contentsOf: number[i...])
//            break
//        } else {
//            stack.append(number[i])
//        }
//    }
//    return String(stack.joined())
//}


//print()


//func solution(_ n:Int) -> String {
//
//    return n % 2 == 0 ? "수박" * (n / 2) : "수박" * (n / 2) + "수"
//
//}


//func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
//    let n = arr1.count
//    let m = arr1[0].count
//
//    var result = [[Int]]()
//
//    for i in 0..<n {
//        for j in 0..<m {
//            result[i][j] = arr1[i][j] + arr2[i][j]
//        }
//    }
//
//    return result
//}




//print(a?)
//print(Array(a[1])[0].uppercased())

//a.joined(separator: " ")




//func solution(_ s:String) -> Int {
//    let s = Array(s)
//    var test: String = ""
//    var result: String = ""
//    let words: [String: String] = ["zero": "0", "one": "1",
//                                   "two": "2", "three": "3",
//                                   "four": "4", "five": "5",
//                                   "six": "6", "seven": "7",
//                                   "eight": "8", "nine": "9"]
//
//    for c in s {
//        if c.isNumber {
//            result.append(String(c))
//            continue
//        }
//
//        test.append(String(c))
//        if words.keys.contains(test) {
//            result.append(words[test]!)
//            test = ""
//        }
//    }
//
//
//    return Int(result)!
//}


//func solution(_ s:String) -> Int {
//    var s = s
//    let arr = ["zero", "one",
//               "two", "three",
//               "four", "five",
//               "six", "seven",
//               "eight","nine"]
//
//    arr.forEach { s.replacingOccurrences(of: $0, with: String($0)) }
//    return Int(s)!
//}
//
//print(Int("one"))


func solution(_ numbers:[Int]) -> [Int] {
    var result = [Int]()

    for i in 0 ..< numbers.count {
        for j in i + 1 ..< numbers.count {
            print("\(i), \(j)")
            let num = numbers[i] + numbers[j]
            if !result.contains(num) {
                result.append(num)
            }
        }
    }
    return result.sorted()
}


solution([2,1,3,4,1]    )
