import Foundation

let N: Int = Int(readLine()!)!
var firstArray: [Int] = readLine()!.split(separator: " ") .map { Int($0)! }.sorted()
let M: Int = Int(readLine()!)!
var secondArray: [Int] = readLine()!.split(separator: " ") .map { Int($0)! }

var result: [Int] = []

for n in secondArray {
    result.append(binarySearch(firstArray, n))
}

for i in result {
    print(i)
}


func binarySearch(_ firstArray: [Int], _ temp: Int) -> Int {

    if temp < firstArray[0] {
        return 0
    } else if temp > firstArray.last! {
        return 0
    } else {
        var start: Int = 0
        var end: Int = firstArray.count - 1
        var mid: Int = (start + end) / 2
        while end - start >= 0 {
            if firstArray[mid] == temp {
                return 1
            } else if firstArray[mid] < temp {
                start = mid + 1
            } else if firstArray[mid] > temp { 
                end = mid - 1
            }
            mid = (start + end) / 2
        }

    }
    return 0
}


