let input = Int(readLine()!)!

var count = 0
var num = 665

while true {
    num += 1
    var c = 0
    for i in String(num) {
        if i == "6" {
            c += 1
            if c == 3 {
                break
            }
        } else {
            c = 0
        }
    }
    
    if c == 3 {
        count += 1
    }
    
    if count == input {
        print(num)
        break
    }
}