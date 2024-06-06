let nums = [1, 2, 3, 4, 5, 6]
var visited = Array(repeating: false, count: nums.count)

func makePermutation(currentNums: [Int]) { 
  if currentNums.count == 3 { 
    print(currentNums)
  }

  for i in 0..<nums.count { 
    if visited[i] == true { 
      continue
    } else { 
      visited[i] = true
      makePermutation(currentNums: currentNums + [nums[i]])
      visited[i] = false
    }
  }
}

makePermutation(currentNums: [])