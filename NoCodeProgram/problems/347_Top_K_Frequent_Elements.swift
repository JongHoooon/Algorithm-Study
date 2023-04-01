func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    var dict: [Int: Int] = [:]
    
    for n in nums {
        dict[n, default: 0] += 1
    }
    var maxHeap = Heap<(Int, Int)>(sort: {
        $0.1 > $1.1
    })

    for e in Array(dict) {
        maxHeap.insert(e)
    }

    var answer: [Int] = []
    for _ in 0..<k {
        guard let popped = maxHeap.pop() else {
            break
        }
        answer.append(popped.0)
    }
    return answer
}

print(topKFrequent([1,1,1,2,2,3], 2))

struct Heap<T> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    private func getParentIdx(_ idx: Int) -> Int {
        return (idx - 1) / 2
    }

    private func getLChildIdx(_ idx: Int) -> Int {
        return idx * 2 + 1
    }

    private func getRChildIdx(_ idx: Int) -> Int {
        return idx * 2 + 2
    }

    mutating func insert(_ element: T) {
        var idx: Int  = nodes.count
        nodes.append(element)
        while idx > 0 && sort(nodes[idx], nodes[getParentIdx(idx)]) {
            let parentIdx = getParentIdx(idx)
            nodes.swapAt(idx, parentIdx)
            idx = parentIdx
        }
    }

    mutating func pop() -> T? {
        nodes.swapAt(0, nodes.count-1)
        let popped: T? = nodes.popLast()
        var idx: Int = 0

        while getLChildIdx(idx) <= nodes.count - 1 {
            let leftChildIdx = getLChildIdx(idx)
            let rightChildIdx = getRChildIdx(idx)

            if getRChildIdx(idx) <= nodes.count - 1 {
                let childIdx: Int = sort(nodes[leftChildIdx], nodes[rightChildIdx]) ? leftChildIdx : rightChildIdx

                if sort(nodes[childIdx], nodes[idx]) {
                    nodes.swapAt(childIdx, idx)
                    idx = childIdx
                } else {
                    break
                }
            } else {
                if sort(nodes[leftChildIdx], nodes[idx]) {
                    nodes.swapAt(leftChildIdx, idx)
                    idx = leftChildIdx
                } else {
                    break
                }
            }
        }
        return popped
    }
}
