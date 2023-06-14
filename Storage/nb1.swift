

func solution(_ arr: [Int]) -> [Int] {

    var dict: [Int: Int] = [:]
    for n in arr { 
        dict[n, default: 0] += 1
    }

    var answer: [Int] = []

    for (_, value) in dict.sorted { $0.key < $1.key }  { 
        guard value > 1 else { continue }

        answer.append(value)
    }

    return answer.isEmpty ? [-1] : answer
}

print(solution([1,2,3,3,3,3,4,4]))
print(solution([3,2,4,4,2,5,2,5,5]))
print(solution([3,5,7,9,1]))
