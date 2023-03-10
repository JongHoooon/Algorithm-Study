import Foundation 

var arr = [Int]()
var a: Int = 0
var b: Int = 0

for _ in 0..<9 {
    arr.append(Int(readLine()!)!)
}
let sum = arr.reduce(0, +)

out: for i in 0..<9 { 
    for j in i+1..<9 {
        a = arr[i]
        b = arr[j]
        if sum - a - b == 100 {
            break out
        } 
    }
}

arr.remove(at: arr.firstIndex(of: a)!)
arr.remove(at: arr.firstIndex(of: b)!)

arr.sort()

for n in arr {
    print(n)
}
