import Foundation

struct Heap<T: Comparable> {
    var nodes: [T] = []
    private let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)

        while index > 0 && sort(nodes[index], nodes[(index-1)/2]) { 
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }

    mutating func delete() -> T {
        
        if nodes.count == 1 {
            return nodes.removeLast()
        }

        nodes.swapAt(0, nodes.count - 1)
        let result = nodes.removeLast()
        var index = 0
        
        while index < nodes.count { 
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1

            let child = [leftChild, rightChild]
                .filter { $0 < nodes.count && sort(nodes[$0], nodes[index]) }
                .sorted { nodes[$0] > nodes[$1] }

            if child.isEmpty { 
                break
            } else { 
                nodes.swapAt(index, child[0])
                index = child[0]
            }
        }
        return result
    } 
}

var maxHeap = Heap<Int>(sort: >)
for _ in 1...Int(readLine()!)! {
    let n = Int(readLine()!)!
    if n == 0 {
        maxHeap.isEmpty ? print(0) : print(maxHeap.delete())
    } else {
        maxHeap.insert(n)
    }
}
