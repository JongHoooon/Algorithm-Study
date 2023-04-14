
struct objectVal { 
    let weight: Int 
    let value: Int
}

func knapSack(objectVals: [objectVal], weightLimit: Int) -> Int { 
    let objectValCount: Int = objectVals.count
    var dpTable: [[Int]] = Array(
        repeating: Array(repeating: 0, count: weightLimit+1), 
        count: objectValCount+1
    )
    
    for rowIdx in 1..<dpTable.count { 
        for colIdx  in 1..<weightLimit+1 { 
            
        }
    }
    

    return 0
}