
let ND = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let N = ND[0]
let D = ND[1]




/*

0...50...100.............151
              110...140

10 + 40 + 40

N: 지름길 갯수
D: 고속도로의 길이
시작위치, 도착위치, 지름길의 길이


*/
