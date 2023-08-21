var n = Int(readLine()!)!

print(countChange(n))

func countChange(_ n: Int) -> Int { 
    var n = n
    
    if n < 5 && n % 2 == 1 { 
        return -1
    }

    var count = n / 5
    n = n - count * 5

    if n % 2 == 0 { 
        count += n / 2
    } else { 
        count += (n+5) / 2 - 1
    }

    return count
}