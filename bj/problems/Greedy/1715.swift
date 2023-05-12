import Foundation

let n: Int = Int(readLine()!)!

var minHeap: Heap<Int> = Heap<Int>(sort: <)

for _ in 0..<n { 
    let num: Int = Int(readLine()!)!
    minHeap.insert(num)
}

var answer: Int = 0
while minHeap.nodes.count > 1 { 
    let min1: Int = minHeap.pop()
    let min2: Int = minHeap.pop()

    answer += min1 + min2
    minHeap.insert(min1 + min2)
}

print(answer)

struct Heap<T: Comparable> {
    var nodes: [T] = []
    let sort: (T, T) -> Bool
    var isEmpty: Bool {
        return nodes.isEmpty
    }

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    mutating func insert(_ element: T) { 
        var idx = nodes.count
        nodes.append(element)
        while idx > 0 && sort(nodes[idx], nodes[(idx-1)/2]) { 
            nodes.swapAt((idx-1)/2, idx)
            idx = (idx-1)/2
        }
    }

    mutating func pop() -> T { 
        nodes.swapAt(0, nodes.count-1)
        let popped = nodes.removeLast()
        var idx = 0

        while idx * 2 + 1 <= nodes.count - 1 { 
            let lChildIdx: Int = idx * 2 + 1
            let rChildIdx: Int = idx * 2 + 2

            if rChildIdx < nodes.count { 
                let childIdx = sort(nodes[lChildIdx], nodes[rChildIdx]) ? lChildIdx : rChildIdx 

                if sort(nodes[childIdx], nodes[idx]) { 
                    nodes.swapAt(childIdx, idx)
                    idx = childIdx
                } else {
                    break
                }

            } else { 

                if sort(nodes[lChildIdx], nodes[idx]) {
                    nodes.swapAt(lChildIdx, idx)
                    idx = lChildIdx
                } else {
                    break
                }
            }
        }

        return popped
    }
}