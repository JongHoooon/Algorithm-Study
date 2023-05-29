
var input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

input.sort()

func gcd(x: Int, y: Int) -> Int { 
    if y == 0 { return x } 
    return gcd(x: y, y: x % y)
}

func lcm(x: Int, y: Int) -> Int {
    return (x * y) / gcd(x: x, y: y)
}

print(gcd(x: input[0], y: input[1]))
print(lcm(x: input[0], y: input[1]))

/*
6 9 
9 0

9 6
6 3

*/