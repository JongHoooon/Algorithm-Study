
/*

let N = Int(readLine()!)!

if N % 2 == 0 { 
    print("CY")
} else { 
    print("SK")
}

*/


// Top Down

let N = Int(readLine()!)!
var cache = Array(repeating: -1, count: 1001)

func topDown(_ n: Int) -> Int { 

    if cache[n] != -1 {
        return cache[n]
    } 

    if n == 1 || n == 3 {
        cache[n] = 1
    } else if n == 2 {
        cache[n] = 2
    } else { 
        cache[n] = min(topDown(n-1), topDown(n-3)) + 1
    }

    return cache[n]
}

if topDown(N) % 2 == 1 { 
    print("SK")
} else { 
    print("CY")
}


/*
// Bottom Up

let N = Int(readLine()!)!
var cache = Array(repeating: -1, count: 1001)
cache[1] = 1
cache[2] = 2
cache[3] = 1

if N >= 4 { 
    for i in 4...N { 
        cache[i] = min(cache[i-3], cache[i-1]) + 1
    }
}

if cache[N] % 2 == 1 {
    print("SK")
} else {
    print("CY")
}

*/