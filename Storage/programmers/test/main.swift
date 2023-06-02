//
//  main.swift
//  test
//
//  Created by JongHoon on 2023/04/15.
//

import Foundation

struct Heap<T: Comparable> {
    var nodes: [T] = []
    let sort: (T, T) -> Bool
    
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
                                
    mutating func pop() -> T? {
        
        nodes.swapAt(0, nodes.count-1)
        let popped = nodes.removeLast()
        var index: Int = 0
        
        while index * 2 + 1 <= nodes.count - 1 {
            let leftChild: Int = index * 2 + 1
            let rightChild: Int = leftChild + 1
            
            if rightChild < nodes.count {
                let child = sort(nodes[leftChild], nodes[rightChild]) ? leftChild : rightChild
                
                if sort(nodes[child], nodes[index]) {
                    nodes.swapAt(child, index)
                    index = child
                } else {
                    break
                }
            } else {
                if sort(nodes[leftChild], nodes[index]) {
                    nodes.swapAt(leftChild, index)
                    index = leftChild
                } else {
                    break
                }
            }
        }
        return popped
    }
}

var minHeap = Heap<Int>(sort: <)

minHeap.insert(1)
minHeap.insert(3)
minHeap.insert(8)
minHeap.insert(2)
minHeap.insert(4)
minHeap.insert(7)
minHeap.insert(1)

print(minHeap.nodes)










