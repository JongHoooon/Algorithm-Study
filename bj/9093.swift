import Foundation 

for _ in 1...Int(readLine()!)! {
    var words = readLine()!.components(separatedBy: " ")
    for (i, word) in words.enumerated() {
        words[i] = String(word.reversed())
    }

    print(words.joined(separator: " "))
}