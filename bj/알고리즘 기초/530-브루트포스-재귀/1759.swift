
/*
시간 복잡도: O(C^L)
공간 복잡도: O(L)
*/
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

func backTracking(index: Int, count: Int) { 

    if index == L {
        var countOfVowels: Int = 0
        var countOfConsonant: Int = 0

        for s: String in answer {                           
            if vowels.contains(s) { countOfVowels += 1 }    
            else { countOfConsonant += 1 }
        }

        if countOfVowels >= 1 && countOfConsonant >= 2 {    
            print(answer.joined())
        }
        return 
    }

    for i: Int in count..<C {                               
        answer.append(characters[i])
        backTracking(index: index+1, count: i+1)
        answer.removeLast()
    }
}

backTracking(index: 0, count: 0)



