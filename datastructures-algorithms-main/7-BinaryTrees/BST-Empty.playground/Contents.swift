import Foundation
import XCTest

/*
 ___ _                      ___                  _      _____
| _ |_)_ _  __ _ _ _ _  _  / __| ___ __ _ _ _ __| |_   |_   _| _ ___ ___
| _ \ | ' \/ _` | '_| || | \__ \/ -_) _` | '_/ _| ' \    | || '_/ -_) -_)
|___/_|_||_\__,_|_|  \_, | |___/\___\__,_|_| \__|_||_|   |_||_| \___\___|
                     |__/
 */

class Node {
    var key: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.key = key
    }
    
    var min: Node {
        if left == nil {
            return self
        } else {
            return self.min
        }
    }
}

class BST {
    var root: Node?

    func insert(key: Int) {
        root = insertItem(root, key)
    }

    private func insertItem(_ node: Node?, _ key: Int) -> Node {
        guard let node = node else {
            let node = Node(key)
            return node
        }
        
        if key < node.key {
            node.left = insertItem(node.left, key)
        }
        if key > node.key {
            node.right = insertItem(node.right, key)
        }
        
        return node
    }

    func find(key: Int) -> Int? {
        guard let root = root else { return nil }
        guard let node = find(root, key) else { return nil }
        
        return node.key
    }

    private func find(_ node: Node?, _ key: Int) -> Node? {
        guard let node = node else { return nil }
        
        if node.key == key {
            return node
        } else if key < node.key {
            return find(node.left, key)
        } else if key > node.key {
            return find(node.right, key)
        }
        return nil
        // Note: duplicate keys not allowed so don't need to check
    }
    
    func findMin() -> Int {
        guard let root = root else { return 0 }
        return findMin(root).key
    }

    private func findMin(_ node: Node) -> Node {
        return node.min
    }

    func delete(key: Int) {
        guard let _ = root else { return }
        root = delete(&root, key)
        
    }
    
    private func delete(_  node: inout Node?, _ key: Int) -> Node? {
        guard let nd = node else { return nil }
        
        if key < nd.key {
            nd.left = delete(&nd.left, key)
        } else if key > nd.key {
            nd.right = delete(&nd.right, key)
        } else {
            // This is the node we want to delete
            
            // Case 1: No child
            if nd.left == nil && nd.right == nil {
                return nil
            }
            
            // Case 2: One child
            if nd.left == nil {
                return nd.right
            }
            if nd.right == nil {
                return nd.left
            }
            
            // Case 3: Two children
            else {
                let minRight = findMin(nd.right!)
                
                nd.key = minRight.key
                
                nd.right = delete(&nd.right, nd.key)
            }
        }
        
        
        return nil
    }

    func prettyPrint() {
        // Hard code print for tree depth = 3
        let rootLeftKey = root?.left == nil ? 0 : root?.left?.key
        let rootRightKey = root?.right == nil ? 0 : root?.right?.key
        
        var rootLeftLeftKey = 0
        var rootLeftRightKey = 0
        
        if root?.left != nil {
            rootLeftLeftKey = root?.left?.left == nil ? 0 : root?.left?.left?.key as! Int
            rootLeftRightKey = root?.left?.right == nil ? 0 : root?.left?.right?.key as! Int
        }
        
        var rootRightLeftKey = 0
        var rootRightRightKey = 0
        
        if root?.right != nil {
            rootRightLeftKey = root?.right?.left == nil ? 0 : root?.right?.left?.key as! Int
            rootRightRightKey = root?.right?.right == nil ? 0 : root?.right?.right?.key as! Int
        }
     
        let str = """
                       \(root!.key)
                    /    \\
                   \(rootLeftKey!)      \(rootRightKey!)
                  / \\    /  \\
                 \(rootLeftLeftKey)   \(rootLeftRightKey)  \(rootRightLeftKey)    \(rootRightRightKey)
        """
        
        print(str)
    }
}

class BSTTests: XCTestCase {
    var bst: BST!
    override func setUp() {
        super.setUp()
        bst = BST()
    }
    
    func testInsert() {
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
        bst.insert(key: 8)
        
        bst.prettyPrint()
        
        XCTAssertNotNil(bst.find(key: 5))
    }
    
    func testDeleteNoChild() {
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
        bst.insert(key: 8)
        
        XCTAssertNotNil(bst.find(key: 2))
        bst.delete(key: 2)
        XCTAssertNil(bst.find(key: 2))
    }

    func testDeleteOneChild() {
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
//        bst.insert(key: 8)
        
        bst.delete(key: 7)
        XCTAssertNil(bst.find(key: 7))
    }

    func testDeleteTwoChildren() {
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
        bst.insert(key: 8)
        
        bst.delete(key: 7)
        XCTAssertNil(bst.find(key: 7))
        XCTAssertNotNil(6)
        XCTAssertNotNil(8)
    }
}


// Infrastructure for running unit tests in playground

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
//BSTTests.defaultTestSuite.run()

