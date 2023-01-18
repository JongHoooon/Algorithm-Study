import Foundation

func solution(_ name: String) -> Int {
    
    let name = Array(name)
    let aValue = Int(Character("A").asciiValue!)
    let zValue = Int(Character("Z").asciiValue!)

    var upDown = 0
    var leftRight = name.count-1

    for startIdx in 0..<name.count {
        upDown += min(Int(name[startIdx].asciiValue!) - aValue,
                      zValue - Int(name[startIdx].asciiValue!) + 1)

        var endIdx = startIdx + 1
        while endIdx < name.count && name[endIdx] == "A" {
            endIdx += 1
        }
        
        let moveFront = startIdx * 2 + (name.count - endIdx)
        let moveBack = (name.count - endIdx) * 2 + startIdx

        leftRight = min(leftRight, moveFront)
        leftRight = min(leftRight, moveBack)
    }

    return upDown + leftRight
}

