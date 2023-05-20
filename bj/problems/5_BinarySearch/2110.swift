
let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let n = input[0]
let c = input[1]

var houses: [Int] = []
for _ in 0..<n { 
    let house = Int(readLine()!)!
    houses.append(house)
}
houses.sort()

var low = 1
var high = houses.last! - houses.first!

func isPossible(distance: Int) -> Bool {
    var count = 1
    var prev = 0
    for i in 1..<houses.count { 
        if houses[i] - houses[prev] >= distance {
            count += 1
            prev = i
        }
    }

    return count >= c
}

var maxDist = 1
while low <= high {
    let mid = (low + high) / 2
    if isPossible(distance: mid) { 
        maxDist = max(maxDist, mid)
        low = mid + 1
    } else { 
        high = mid - 1
    }
}

print(maxDist)