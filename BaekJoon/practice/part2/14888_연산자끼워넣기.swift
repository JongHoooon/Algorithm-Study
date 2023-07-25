
let N = Int(readLine()!)!
let nums = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

var operators = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

var maxAnswer = Int.min
var minAnswer = Int.max

func dfs(_ current: Int, _ depth: Int) {
    if depth == N { 
        maxAnswer = max(maxAnswer, current)
        minAnswer = min(minAnswer, current)
        return
    }

    for i in 0..<4 { 
        guard operators[i] > 0 else { continue }

        operators[i] -= 1

        switch i { 
        case 0:     dfs(current+nums[depth], depth+1)
        case 1:     dfs(current-nums[depth], depth+1)
        case 2:     dfs(current*nums[depth], depth+1)
        case 3:     dfs(current/nums[depth], depth+1)
        default:    break
        }
        operators[i] += 1
    }
}

dfs(nums[0], 1)

print(maxAnswer)
print(minAnswer)