import Foundation

let n = Int(readLine()!)!
var binaryTree: [[Int]] = Array(repeating: [], count: n)
var visit = Array(repeating: false, count: n)

var preOrderArr = [Character]()
var inOrderArr = [Character]()
var postOrderArr = [Character]()

for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { n -> Int in
        if n == "." { 
            return -1 
        } else {
            return Int(Character(n).asciiValue! - 65)
        } 
    }
    binaryTree[input[0]] = Array(input[1...2])
}

preOrderSearch(0)
inOrderSearch(0)
postOrderSearch(0)
print(String(preOrderArr))
print(String(inOrderArr))
print(String(postOrderArr))


func preOrderSearch(_ node: Int) { 
    visit[node] = true
    preOrderArr.append(Character(UnicodeScalar(node+65)!))
    for i in 0..<2 {
        if binaryTree[node][i] == -1 {
            continue
        }
        if visit[binaryTree[node][i]] == true { 
            continue
        }
        preOrderSearch(binaryTree[node][i])
    }
}

func inOrderSearch(_ node: Int) {
    if binaryTree[node][0] != -1 && binaryTree[node][1] != -1 {
        inOrderSearch(binaryTree[node][0])
        inOrderArr.append(Character(UnicodeScalar(node+65)!))
        inOrderSearch(binaryTree[node][1])
    } else if binaryTree[node][0] == -1 && binaryTree[node][1] != -1 {
        inOrderArr.append(Character(UnicodeScalar(node+65)!))
        inOrderSearch(binaryTree[node][1])
    } else if binaryTree[node][0] != -1 && binaryTree[node][1] == -1 {
        inOrderSearch(binaryTree[node][0])
        inOrderArr.append(Character(UnicodeScalar(node+65)!))
    } else {
        inOrderArr.append(Character(UnicodeScalar(node+65)!))
    }
}

func postOrderSearch(_ node: Int) {
    if binaryTree[node][0] != -1 && binaryTree[node][1] != -1 {
        postOrderSearch(binaryTree[node][0])
        postOrderSearch(binaryTree[node][1])
        postOrderArr.append(Character(UnicodeScalar(node+65)!))
    } else if binaryTree[node][0] == -1 && binaryTree[node][1] != -1 {
        postOrderSearch(binaryTree[node][1])
        postOrderArr.append(Character(UnicodeScalar(node+65)!))
    } else if binaryTree[node][0] != -1 && binaryTree[node][1] == -1 {
        postOrderSearch(binaryTree[node][0])
        postOrderArr.append(Character(UnicodeScalar(node+65)!))
    } else {
        postOrderArr.append(Character(UnicodeScalar(node+65)!))
    }
}

