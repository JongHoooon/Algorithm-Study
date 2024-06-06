let arr = [1, 2, 3, 4, 5]

func makeCombination(depth: Int, index: Int, currentArray: [Int]) {
  if depth == 3 { 
    print(currentArray)
    return 
  }

  for i in index..<arr.count { 
    makeCombination(depth: depth + 1, index: i + 1, currentArray: currentArray + [arr[i]])
  }
}

makeCombination(depth: 0, index: 0, currentArray: [])
