//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by JongHoon on 2023/01/21.
//

import Foundation

//func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
//    var nums: [Int] = nums
//    let count = nums.count
//    if count == 1 {return nums[0] }
//
//    let pivot: Int = 0
//    var left: Int = 1
//    var right: Int = count - 1
//
//    while left <= right {
//        if nums[left] <= nums[pivot] {
//            left += 1
//            continue
//        }
//
//        if nums[right] > nums[pivot] {
//            right -= 1
//            continue
//        }
//
//        if nums[left] > nums[pivot] && nums[right] <= nums[pivot] {
//            nums.swapAt(left, right)
//            continue
//        }
//    }
//
//    nums.swapAt(pivot, right)
//    if left == count - k {
//        return nums[left]
//    } else if left > count - k {
//        return findKthLargest(Array(nums[0..<left]), k - (count - left))
//    } else {
//        return findKthLargest(Array(nums[left..<count]), k)
//    }
//}


struct Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }

    private func getParentIdx(_ index: Int) -> Int {
        return (index - 1) / 2
    }

    private func getLeftChildIdx(_ index: Int) -> Int {
        return index * 2 + 1
    }

    private func getRightIdx(_ index: Int) -> Int {
        return index * 2 + 2
    }

    mutating func insert(_ element: T) {
        var index: Int = nodes.count
        nodes.append(element)
        while index > 0 && sort(nodes[index], nodes[getParentIdx(index)]) {
            let parentIdx: Int = getParentIdx(index)
            nodes.swapAt(index, parentIdx)
            index = parentIdx
        }
    }

    mutating func pop() -> T? {
        nodes.swapAt(0, nodes.count - 1)
        let popped: T? = nodes.popLast()
        var index: Int = 0

        // 자식이 있는 경우
        while getLeftChildIdx(index) <= nodes.count - 1 {
            let leftChildIdx: Int = getLeftChildIdx(index)
            let rightChildIdx: Int = getRightIdx(index)

            // left, right 둘다 있는 경우
            if rightChildIdx < nodes.count {
                let child: Int = sort(nodes[leftChildIdx], nodes[rightChildIdx]) ? leftChildIdx : rightChildIdx
                

                if sort(nodes[child], nodes[index]) {
                    nodes.swapAt(child, index)
                    index = child
                } else {
                    break
                }
            } else {  // left만 있는경우
                print("teeteteettet ")
                if sort(nodes[leftChildIdx], nodes[index]) {
                    nodes.swapAt(leftChildIdx, index)
                    index = leftChildIdx
                } else {
                    break
                }
            }
        }
        return popped
    }
}

var minHeap: Heap<Int> = Heap<Int>(sort: <)

// minHeap.insert(5)
// minHeap.insert(7)
// minHeap.insert(23)
// minHeap.insert(2)
// minHeap.insert(9)
// minHeap.insert(1)
// minHeap.insert(13)
// minHeap.insert(8)
minHeap.insert(9)
minHeap.insert(13)
minHeap.insert(23)



while !minHeap.isEmpty {
    print(minHeap.pop()!)
}

