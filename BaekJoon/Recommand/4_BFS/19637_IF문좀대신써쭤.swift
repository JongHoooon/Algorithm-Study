
let nm = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let n = nm[0]
let m = nm[1]

var powers: [Int] = []
var names: [String] = []

for _ in 0..<n { 
    let input = readLine()!
        .split(separator: " ")
    let name = String(input[0])
    let power = Int(input[1])

    if !powers.isEmpty && powers.last == power { 
        continue
    }
    powers.append(power!)
    names.append(name)
}

func binarySearch(p: Int) { 
    var left = 0
    var right = powers.count - 1

    while left <= right { 
        let mid = (left + right) / 2
        if p > powers[mid] { 
            left = mid + 1
        } else { 
            right = mid - 1
        }
    }
    print(names[right+1])
}

for _ in 0..<m { 
    let p = Int(readLine()!)!
    binarySearch(p: p)
}