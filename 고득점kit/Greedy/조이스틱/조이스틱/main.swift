import Foundation

//func solution(_ maps: [String]) -> [Int] {
//    let graph = maps.reduce(into: [[Character]]()) { result, map in
//        result.append(Array(map))
//    }
//    let row = graph.count
//    let col = graph[0].count
//    let dx = [0, 0, 1, -1]  // 상 하 좌 우
//    let dy = [-1, 1, 0, 0]
//    var visit = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
//
//    func dfs(_ x: Int, _ y: Int) -> Int {
//        if graph[x][y] == "X" { return 0 }
//        var sum = Int(graph[x][y].asciiValue!) - 48
//        visit[x][y] = true
//        for i in dx.indices {
//            let nx = x + dx[i]
//            let ny = y + dy[i]
//            if nx >= row || nx < 0 || ny >= col || ny < 0 { continue }
//            if visit[nx][ny] { continue }
//            visit[nx][ny] = true
//            sum += dfs(nx, ny)
//        }
//        return sum
//    }
//
//    var ans: [Int] = []
//    for i in 0..<row {
//        for j in 0..<col {
//            if visit[i][j] || graph[i][j] == "X" { continue }
//            let sum = dfs(i, j)
//            if sum > 0 {
//                ans.append(sum)
//            }
//        }
//    }
//
//    return ans.isEmpty ? [-1] : ans.sorted()
//}
//
//
//
//
//
//print(solution(["X591X","X1X5X","X231X", "1XXX1"]))


//func solution(_ s:String) -> String {
//    var words = s.lowercased().components(separatedBy: " ").map { Array($0) }
//    
//    for i in words.indices {
//        if words[i][0].is {
//            words[i][0] = words[i][0].uppercased()
//        }
//    }
//    print(words)
//    
//    print(words)
//    
//    return ""
//}
//
//
//struct Heap<T: Comparable> {
//    var nodes: [T] = []
//    private let sort: (T, T) -> Bool
//
//    init(sort: @escaping (T, T) -> Bool) {
//        self.sort = sort
//    }
//
//    var isEmpty: Bool {
//        return nodes.isEmpty
//    }
//
//    mutating func insert(_ element: T) {
//        var index = nodes.count
//        nodes.append(element)
//
//        while index > 0 && sort(nodes[index], nodes[(index-1)/2]) {
//            nodes.swapAt(index, (index-1)/2)
//            index = (index-1)/2
//        }
//    }
//
//    mutating func delete() -> T {
//
//        if nodes.count == 1 {
//            return nodes.removeLast()
//        }
//
//        nodes.swapAt(0, nodes.count - 1)
//        let result = nodes.removeLast()
//        var index = 0
//
//
//        while index < nodes.count {
//            let leftChild = index * 2 + 1
//            let rightChild = leftChild + 1
//
//            let child = [leftChild, rightChild]
//                .filter { $0 < nodes.count && sort(nodes[$0], nodes[index]) }
//                .sorted { nodes[$0] > nodes[$1] }
//
//            if child.isEmpty {
//                break
//            } else {
//                nodes.swapAt(index, child[0])
//                index = child[0]
//            }
//        }
//        return result
//    }
//}
//
//var maxHeap = Heap<Int>(sort: >)
//for _ in 1...Int(readLine()!)! {
//    let n = Int(readLine()!)!
//    if n == 0 {
//        maxHeap.isEmpty ? print(0) : print(maxHeap.delete())
//    } else {
//        maxHeap.insert(n)
//    }
//}







struct Stack {
    var arr: [Int] = []

    mutating func push(_ element: Int) {
        arr.append(element)
    }

    mutating func pop() -> Int {
        if arr.isEmpty {
            return -1
        }
        return arr.removeLast()
    }

    var empty: Int {
        return arr.isEmpty ? 1 : 0
    }

    var top: Int {
        if arr.isEmpty {
            return -1
        }
        return arr.last!
    }
}

var stack = Stack()

for _ in 1...Int(readLine()!)! {
    let commands = readLine()!.components(separatedBy: " ")
     if commands[0] == "push" {
        stack.push(Int(commands[1])!)
     } else if commands[0] == "pop" {
        print(stack.pop())
     } else if commands[0] == "empty" {
        print(stack.empty)
     } else if commands[0] == "top" {
        print(stack.top)
     }
}
