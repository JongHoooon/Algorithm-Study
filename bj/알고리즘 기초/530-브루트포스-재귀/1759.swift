
let LC: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let L: Int = LC[0]
let C: Int = LC[1]
var characters: [String] = readLine()!
    .split(separator: " ")
    .map { String($0) }
    .sorted()    


let vowels: [String] = ["a", "e", "i", "o", "u"]
var answer: [String] = []

func backTracking(depth: Int, count: Int) { 

    if depth == L {
        var countOfVowels: Int = 0
        var countOfConsonant: Int = 0
        
        for s in answer { 
            if vowels.contains(s) { 
                countOfVowels += 1
            } else { 
                countOfConsonant += 1 
            }
        }
        if countOfVowels >= 1 && countOfConsonant >= 2 {
            print(answer.joined()) 
        }
        return
    }

    for i in count..<C { 
        answer.append(characters[i])
        backTracking(depth: depth+1, count: i+1)
        answer.removeLast()
    }
}

backTracking(depth: 0, count: 0)
