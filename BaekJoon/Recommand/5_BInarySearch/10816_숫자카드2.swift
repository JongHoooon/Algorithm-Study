_ = readLine()
let nNums = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
_ = readLine()!
let mNums = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

var countDict: [Int: Int] = [:]

for n in nNums { 
    countDict[n, default: 0] += 1
}

for m in mNums { 
    print(countDict[m, default: 0], terminator: " ")
}