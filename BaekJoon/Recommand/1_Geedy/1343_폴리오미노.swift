
var input = readLine()!

input.replace("XXXX", with: "AAAA")
input.replace("XX", with: "BB")

if input.contains("X") { 
    print(-1)
} else {
    print(input)
}