import Foundation

let t = Int(readLine()!)!

for _ in 0..<t { 
    let arr = readLine()!
        .components(separatedBy: " ")
        .map { Int($0)! }

    var answer: [Int] = []
    for i in 1..<arr.count-1 { 
        for j in i+1..<arr.count { 
            answer.append(gcd(arr[i], arr[j]))
        }
    }
    print(answer.reduce(0, +))
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a % b)
}