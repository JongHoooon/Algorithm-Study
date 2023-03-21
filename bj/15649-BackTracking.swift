
/*
시간복잡도: O(N^M)
공간복잡도: O(M)
116 ms
*/
/*
let NM: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N: Int = NM[0]
let M: Int = NM[1]
var answer: [Int] = []

func backTracking(index: Int) { 

    if index == M { 
        let answer: [String] = answer.map { String($0) }
        print(answer.joined(separator: " "))
        return
    }

    let nexts: [Int] = (1...N).filter { !answer.contains($0) } 
    for n: Int in nexts {
        answer.append(n)
        backTracking(index: index+1)
        answer.removeLast()
    }
}

backTracking(index: 0)
*/


/*
시간복잡도: O(N^M)
36ms
*/
let NM: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
let N: Int = NM[0]
let M: Int = NM[1]
var output: String = ""
var remainders: [Bool] = Array(repeating: true, count: N)

func backTracking(depth: Int, current: String) { 

    if depth == M { 
        for i: Int in 0..<N {
            if remainders[i] { 
                output += "\(current)\(i+1)\n"
            }
        }
        return
    }

    for i: Int in 0..<N {
        if remainders[i] {
            remainders[i] = false
            backTracking(depth: depth+1, current: "\(current)\(i+1) ")
            remainders[i] = true
        }
    }
}

backTracking(depth: 1, current: "")
print(output)