//
//  main.swift
//  표 병합
//
//  Created by JongHoon on 2023/04/23.
//

import Foundation

//func solution(_ commands:[String]) -> [String] {
//    let commands: [[String]] = commands
//        .map { $0.split(separator: " ").map { String($0) } }
//
//    var table: [[String]] = Array(
//        repeating: Array(repeating: "", count: 50),
//        count: 50
//    )
//
//    func update(_ r: String, _ c: String, _ value: String) {
//        let r: Int = Int(r)! - 1
//        let c: Int = Int(c)! - 1
//
//        table[r][c] = value
//    }
//
//    func update(_ value1: String, _ value2: String) {
//        for i in 0..<50 {
//            for j in 0..<50 {
//                if table[i][j] == value1 { table[i][j] = value2 }
//            }
//        }
//    }
//
//    func merge(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) {
//        if r1 == r2 && c1 == c2 { return }
//        let cell1 = table[r1][c1]
//        let cell2 = table[r2][c2]
//        if cell1.isEmpty && cell2.isEmpty { return }
//
//        if cell1.isEmpty { table[r1][c1] = cell2 }
//        else { table[r2][c2] = cell2 }
//    }
//
////    func unmerge
//
//    for command in commands {
//        switch command[0] {
//            case "UPDATE":
//            if command.count == 4 {
//                update(command[1], command[2], command[3])
//            } else {
//                update(command[1], command[2])
//            }
//            case "MERGE":
//            print("1")
//            case "UNMERGE":
//            print("1")
//            case "PRINT":
//            print("1")
//            default:
//            break
//        }
//    }
//
//    return []
//}
//
//solution(["UPDATE 1 1 menu", "UPDATE 1 2 category", "UPDATE 2 1 bibimbap", "UPDATE 2 2 korean", "UPDATE 2 3 rice", "UPDATE 3 1 ramyeon", "UPDATE 3 2 korean", "UPDATE 3 3 noodle", "UPDATE 3 4 instant", "UPDATE 4 1 pasta", "UPDATE 4 2 italian", "UPDATE 4 3 noodle", "MERGE 1 2 1 3", "MERGE 1 3 1 4", "UPDATE korean hansik", "UPDATE 1 3 group", "UNMERGE 1 4", "PRINT 1 3", "PRINT 1 4"])
//
//print("1")


Array(1...3)
    .map {
        print($0)
    }
    
