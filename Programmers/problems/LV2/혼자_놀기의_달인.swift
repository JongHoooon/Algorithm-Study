
import Foundation


/**
solution1

dfs + selectedBoxes로 구현
*/
func solution1(_ cards:[Int]) -> Int {
    let maxNum = cards.max()!
    let cards = cards.map { $0 - 1 }

    var isVisited: [Bool] = Array(repeating: false, count: maxNum)

    var selectedBoxes: [Int] = []
    func selectBox(_ idx: Int) {
        if isVisited[idx] == true {
            return
        }

        isVisited[idx] = true
        let nextIdx = cards[idx]

        selectedBoxes.append(idx)
        selectBox(nextIdx)
        isVisited[idx] = false
    }

    var answer: Int = 0
    for i in 0..<maxNum {
        var first: Int = 0
        var second: Int = 0
        selectBox(i)
        first = selectedBoxes.count
        if first == maxNum {
            continue
        }

        let secondCards = Array(0..<maxNum)
            .filter { !selectedBoxes.contains(cards[$0]) }
        selectedBoxes = []


        for i in secondCards {
            selectBox(i)
            let count = selectedBoxes.count
            selectedBoxes = []
            second = max(count, second)
        }

        answer = max(answer, first*second)
    }

    return answer
}

/**
solution2

isVisited를 복구하는 dfs, 복구하지 않는 dfs 사용해 구현
*/
func solution2(_ cards:[Int]) -> Int {

    let cards = cards.map { $0 - 1 }
    var isVisited: [Bool] = Array(repeating: false, count: cards.count)

    func dfs1(_ idx: Int) -> Int {
        var count = 1
        if isVisited[idx] == true {
            return 0
        }

        isVisited[idx] = true
        let next = cards[idx]
        count += dfs1(next)
        return count
    }

    func dfs2(_ idx: Int) -> Int {
        var count = 1
        if isVisited[idx] == true {
            return 0
        }

        isVisited[idx] = true
        let next = cards[idx]
        count += dfs1(next)
        isVisited[idx] = false
        return count
    }

    var answer = 0
    for i in cards.indices {
        let first = dfs1(i)
        if first == cards.count { break }

        var second = 0
        for j in cards.indices {
            guard isVisited[j] == false else { continue }
            let count = dfs2(j)
            second = max(second, count)
        }
        print(answer, first, second)
        answer = max(answer, first * second)
        isVisited = Array(repeating: false, count: cards.count)
    }

    return answer
}

print(solution2([8,6,3,7,2,5,1,4]))
