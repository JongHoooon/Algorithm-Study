
let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let start: Int = input[0]-1
let end: Int = input[1]-1

var nums: [Int] = []
var count: Int = 0
var num: Int = 1

while count < 1000 {
    for _ in 0..<num {
        nums.append(num) 
        count += 1
    }
    num += 1
}

var sum: Int = 0

for i in start...end { 
    sum += nums[i]
}

print(sum)