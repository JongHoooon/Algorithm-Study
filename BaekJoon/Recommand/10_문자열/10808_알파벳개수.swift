
let chars: [Character] = Array(readLine()!)
let count = Int(UnicodeScalar("z").value) - Int(UnicodeScalar("a").value) + 1
var array: [Int] = Array(repeating: 0, count: count)

for c in chars { 
    let index = Int(UnicodeScalar(String(c))!.value) - Int(UnicodeScalar("a").value)
    array[index] += 1
}

let answer = array
    .map { String($0) }
    .joined(separator: " ")

print(answer)