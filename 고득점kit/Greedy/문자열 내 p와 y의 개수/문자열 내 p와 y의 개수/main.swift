//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by JongHoon on 2023/01/21.
//

import Foundation

// 그래프 노드 정의
class Node {
    var value: Int
    var neighbors: [Node]
    var visited: Bool
    
    init(value: Int) {
        self.value = value
        self.neighbors = []
        self.visited = false
    }
}

// DFS 함수 정의
func dfs(node: Node) {
    print(node.value)
    node.visited = true

    for neighbor in node.neighbors {
        if !neighbor.visited {
            dfs(node: neighbor)
        }
    }
}

/*
func dfs(node: Node) {
    var stack: [Node] = [node]
    node.visited = true
    
    while !stack.isEmpty {
        let current = stack.popLast()!
        print(current.value
        )
        for next in current.neighbors {
            if !next.visited {
                next.visited = true
                stack.append(next)
            }
        }
    }
}
 */

// 그래프 구성 예시
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)
let node5 = Node(value: 5)

node1.neighbors = [node2, node3]
node2.neighbors = [node1, node4, node5]
node3.neighbors = [node1, node4]
node4.neighbors = [node2, node3]
node5.neighbors = [node2]

dfs(node: node1)

