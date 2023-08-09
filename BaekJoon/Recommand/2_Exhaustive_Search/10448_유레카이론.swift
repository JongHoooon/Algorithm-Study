let T = Int(readLine()!)!
var nums: [Int] = []
var limitN = 0
var triangle: [Int] = []

for _ in 0..<T  {
    let n = Int(readLine()!)!
    nums.append(n)
}

let maxN = nums.max()!

for n in 1...45 { 
    if n*(n+1)/2 > maxN { 
        limitN = n-1
        break
    }

    triangle.append(n*(n+1)/2)
}

for n in nums {
    print(eureka(n))
}

func eureka(_ n: Int) -> Int { 
    for i in 0..<limitN { 
        for j in i..<limitN {
            for k in j..<limitN { 
                if triangle[i] + triangle[j] + triangle[k] == n { 
                    return 1
                }
            }
        }
    }

    return 0
}