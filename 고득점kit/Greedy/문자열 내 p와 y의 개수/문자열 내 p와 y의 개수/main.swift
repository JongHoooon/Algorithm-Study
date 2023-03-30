//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by JongHoon on 2023/01/21.
//

//func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
//
//    var stack: [(num: Int, index: Int)] = []
//    var answer: [Int] = []
//
//    for i in stride(from: temperatures.count-1, through: 0, by: -1) {
//        let cur = temperatures[i]
//        while !stack.isEmpty && stack.last!.num < cur {
//            let _ = stack.popLast()
//        }
//
//        if stack.isEmpty {
//            answer.append(0)
//            stack.append((cur, i))
//            continue
//        }
//
//        answer.append(stack.last!.index - i)
//        stack.append((cur, i))
//    }
//
//    return answer.reversed()
//}

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    
    var stack: [(num: Int, index: Int)] = []
    var answer: [Int] = []
    
    for i in stride(from: temperatures.count-1, through: 0, by: -1) {
        let cur = temperatures[i]
        while !stack.isEmpty && stack.last!.num < cur {
            let _ = stack.popLast()
        }
            
        if stack.isEmpty {
            answer.append(0)
        } else {
            answer.append(stack.last!.index - i)
        }
        
        stack.append((cur, i))
    }
        
    return answer.reversed()
}

print(dailyTemperatures([39, 20, 70, 36, 30, 60, 80, 1]))
