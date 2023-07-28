import Foundation

let N = Int(readLine()!)!

for i in 0..<N { 
    if getSum(i) == N { 
        print(i)
        exit(0)
    }
}

print(0)

func getSum(_ n: Int) -> Int { 
    let chars: [Character] = Array(String(n))
    var sum = n

    for c in chars { 
        sum += Int(String(c))!
    }

    return sum
}