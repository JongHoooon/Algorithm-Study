import Foundation

var heights: [Int] =  []

for _ in 0..<9 { 
    let height = Int(readLine()!)!
    heights.append(height)
}

func dfs(_ index: Int, _ current: [Int]) {

    if current.count == 7 { 
        countHeight(current)
        return
    }

    for i in index..<9 {
        dfs(i+1, current + [heights[i]])
    }
}

func countHeight(_ heights: [Int]) {
    var sum = 0

    for height in heights {
        sum += height
    }

    if sum == 100 { 
        let heights = heights.sorted()
        for height in heights {
            print(height)
        }
        exit(0)
    }
}

dfs(0, [])