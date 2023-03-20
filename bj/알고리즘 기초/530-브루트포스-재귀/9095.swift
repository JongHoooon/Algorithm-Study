
let T: Int = Int(readLine()!)!

func solution(n: Int) -> Int { 
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    if n == 3 { return 4 }
    return solution(n: n-1) + solution(n: n-2) + solution(n: n-3)
}

for _ in 0..<T {
    let input: Int = Int(readLine()!)!
    print(solution(n: input))
}