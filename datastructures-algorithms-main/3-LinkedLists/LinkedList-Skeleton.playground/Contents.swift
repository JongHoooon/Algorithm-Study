import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList {
    private var head: Node?
        
    func addFront(_ data: Int) {    // O(1)
        let newNode = Node(data, head)
        head = newNode
    }

    func getFirst() -> Int? {
        return head?.data
    }

    func addBack(_ data: Int) {     // O(n)
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        node.next = newNode
    }

    func getLast() -> Int? {
        guard var node = head else { return nil }
        while node.next != nil {
            node = node.next!
        }
        return node.data
    }

    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        
        for _ in 0..<position - 1 {
            currentNode = currentNode?.next
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    func deleteFirst() {        // O(1)
        head = head?.next
    }

    func deleteLast() {
        /*
        guard var node = head else { return }
        while node.next?.next != nil {
            node = node.next!
        }

        node.next = nil
        */
        
        var nextNode = head
        var previousNode: Node?
        while nextNode?.next != nil {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        
        previousNode?.next = nil
    }
    
    func delete(at position: Int) {
        if position == 0 {
            deleteFirst()
            return
        }
        
        var previousNode: Node?
        var currentNode = head
        for _ in 1...position {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        previousNode?.next = currentNode?.next
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func clear() {
        head = nil
    }
    
    func printLinkedList() {
        guard var node = head else { return }
        
        var result = [Int]()
        result.append(node.data)
        
        while node.next != nil {
            result.append(node.next!.data)
            node = node.next!
        }
        
        print(result)
    }
}

let linkedList = LinkList()

linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)

//linkedList.printLinkedList()

linkedList.addFront(4)
linkedList.addBack(5)
linkedList.printLinkedList()
linkedList.insert(position: 2, data: 6)
linkedList.printLinkedList()

linkedList.deleteFirst()
linkedList.printLinkedList()

linkedList.deleteLast()
linkedList.printLinkedList()

linkedList.delete(at: 2)
linkedList.printLinkedList()

linkedList.isEmpty
linkedList.clear()
linkedList.isEmpty
