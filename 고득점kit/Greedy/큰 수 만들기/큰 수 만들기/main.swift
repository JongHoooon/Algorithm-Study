//
//  main.swift
//  큰 수 만들기
//
//  Created by JongHoon on 2023/01/18.
//

import Foundation


func solution(_ number: String, _ k: Int) -> String {
    let number = number.map { String($0) }
    var stack = [String]()
    var count = 0
    
    for i in 0..<number.count {
        while count < k &&
                !stack.isEmpty &&
                stack.last! < number[i] {
            stack.removeLast()
            count += 1
        }
        if count >= k {
            stack.append(contentsOf: number[i...])
            break
        } else {
            stack.append(number[i])
        }
    }
    return String(stack.joined())
}

