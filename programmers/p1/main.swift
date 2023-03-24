//
//  main.swift
//  p1
//
//  Created by JongHoon on 2023/03/23.
//

import Foundation


//func test(px: [Int]) -> Int {
//    var px: [Int] = px
//    var answer: Int = -1
//    while !px.isEmpty {
//        let current: Int = px.removeFirst()
//        guard let maxValue = px.max() else { break }
//        if maxValue > current {
//            answer = max(answer, maxValue-current)
//        }
//    }
//    return answer
//}
//
//
//print(test(px: [7,9,5,6,3,2]))

//print("ab" < "ba")
//print("cab" < "cba")
//
//
//print(max("aa", "bb"))
//
//var set = Set<Character>()
//
//set.insert("a")
//set.insert("b")
//
//print(set)
//
//set.insert("k")
//
//print(set)

var arr: [Character] = []

arr.append("a")
arr.append("b")
arr.append("c")

arr.remove(at: 1)
arr.removeFirst(arr.firstIndex(of: "a")!)

print(arr)
