import Foundation

struct Heap<T: Comparable> { 
    var nodes: [T] = []

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        while index > 0, nodes[index] > nodes[(index-1)/2] { 
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }

    mutating func delete() -> T {

        if nodes.count == 1 {
            return nodes.removeLast()
        }

        let result = nodes.first!
        nodes.swapAt(0, nodes.count - 1)
        nodes.removeLast()

        var index = 0

        while index < nodes.count {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1

            let child = [leftChild, rightChild]
                .filter { $0 < nodes.count && nodes[$0] > nodes[index] }
                .sorted(by: { nodes[$0] > nodes[$1] })

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

var heap = Heap<Int>()
for _ in 1...Int(readLine()!)! {
    let n = Int(readLine()!)!
    if n == 0 {
        heap.isEmpty ? print(0) : print(heap.delete())
    } else {
        heap.insert(n)
    }
}
