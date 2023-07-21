
let T = Int(readLine()!)!

for _ in 0..<T { 
    let n = Int(readLine()!)!
    let binaryString: [Character] = Array(String(n, radix: 2))
    let reversedBinaryString = binaryString.reversed()

    for (i, c) in reversedBinaryString.enumerated() {
        if c == "1" { 
            print(i, terminator: " ")
        }
    }
    print()
}