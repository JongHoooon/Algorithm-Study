
let n = Int(readLine()!)!

func pibo(_ n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return pibo(n-1) + pibo(n-2)
    }
}

print(pibo(n))