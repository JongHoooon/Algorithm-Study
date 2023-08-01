let N = Int(readLine()!)!
let requests = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
    .sorted()
let budget = Int(readLine()!)!

func binarySearch() { 
    var start = 0
    var end = requests[N-1]

    while start <= end { 
        let mid = (start + end) / 2
        let sum = countSum(mid)

        if sum < budget { 
            start = mid + 1 
        } else if sum > budget { 
            end = mid - 1
        } else {
            print(mid)
            return
        }
    }

    print(end)
}

func countSum(_ limit: Int) -> Int { 
    var sum = 0
    for r in requests { 
        sum += r < limit ? r : limit
    }
    return sum
}

binarySearch()

