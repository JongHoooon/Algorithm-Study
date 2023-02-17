import Foundation


var stack: [Character] = []
var count = 0
var check: Character = "0"

for c in readLine()! {
    if c == "(" {
        stack.append(c)
    } else { 
        stack.popLast()
        if check == "(" {
            count += stack.count
        } else {
            count += 1
        }
    }
    check = c
}
print(count)





/*
stack
) 일때
( 1개 -> 레이저
*/