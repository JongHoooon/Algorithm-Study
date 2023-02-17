import Foundation

var queue: [Int] = []

for _ in 1...Int(readLine()!)! {
    let command = readLine()!
    switch command {
    case "pop":
        print(queue.isEmpty ? -1 : queue.removeFirst())
    case "size":
        print(queue.count)
    case "empty":
        print(queue.isEmpty ? 1 : 0)
    case "front":
        print(queue.isEmpty ? -1 : queue[0])
    case "back":
        print(queue.isEmpty ? -1 : queue.last!)
    default:
        let n = Int(command.components(separatedBy: " ").last!)!
        queue.append(n)
    }
}