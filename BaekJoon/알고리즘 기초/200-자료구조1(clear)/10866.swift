import Foundation

var deque: [String] = []
for _ in 1...Int(readLine()!)! {
    let input: [String] = readLine()!.components(separatedBy: " ")

    switch input[0] {
    case "push_front": 
        deque.insert(input[1], at: 0)
    case "push_back":
        deque.append(input[1])
    case "pop_front":
        print(deque.isEmpty ? -1 : deque.removeFirst())
    case "pop_back":              
        print(deque.isEmpty ? -1 : deque.removeLast())
    case "size":
        print(deque.count)
    case "empty":
        print(deque.isEmpty ? 1 : 0)
    case "front":
        print(deque.isEmpty ? -1 : deque[0])
    case "back":
        print(deque.isEmpty ? -1 : deque.last!)
    default:
        break     
    }
}