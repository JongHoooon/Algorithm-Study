
// let T = Int(readLine()!)!

// var cache = [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)
// for i in 0...30 { 
//     for j in 0...i { 
//         if i == j || j == 0 { 
//             cache[i][j] = 1
//             continue
//         }
//         cache[i][j] = cache[i-1][j-1] + cache[i-1][j]
//     }
// }

// for _ in 0..<T { 
//     let input = readLine()!
//         .split(separator: " ")
//         .map { Int($0)! }

//     let left = input[0]
//     let right = input[1]

//     print(cache[right][left])   
// }


// let T = Int(readLine()!)!
// var cache = [[Int]](
//     repeating: [Int](repeating: -1, count: 31), 
//     count: 31
//     )

// func dp(_ n: Int, _ r: Int) -> Int { 

//     if cache[n][r] != -1 { 
//         return cache[n][r]
//     }

//     if n == r || r == 0 { 
//         cache[n][r] = 1
//         return 1
//     }

//     cache[n][r] = dp(n-1, r-1) + dp(n-1, r)
//     return cache[n][r]
// }

// for _ in 0..<T { 
//     let input = readLine()!
//         .split(separator: " ")
//         .map { Int($0)! }

//     let left = input[0]
//     let right = input[1]

//     print(dp(right, left))   
// }
