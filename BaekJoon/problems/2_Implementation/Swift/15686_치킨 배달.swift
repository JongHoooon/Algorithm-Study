let input: [Int] = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let n = input[0]
let m = input[1]

var mapOfCity: [[Int]] = []

for _ in 0..<n {
    let input: [Int] = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    
    mapOfCity.append(input)
}

typealias Point = (r: Int, c: Int)
var pointsOfHouse: [Point] = []
var pointsOfChicken: [Point] = []
var answer: Int = 987654321

for r in 0..<n {
    for c in 0..<n {
        switch mapOfCity[r][c] {
        case 1:
            pointsOfHouse.append((r, c))
        case 2: 
            pointsOfChicken.append((r, c))
        default:
            break
        }
    }
}

func countDistance(_ point1: Point, _ point2: Point) -> Int { 
    return abs(point1.r-point2.r) + abs(point1.c-point2.c)
} 

func countChickenDistanceOfCity(_ selectedChickens: [Point]) -> Int {
    var chickenDistanceOfCity: Int = 0
    for pointOfHouse in pointsOfHouse { 
        var distance: Int = Int.max
        for pointOfChicken in selectedChickens {
            distance = min(distance, countDistance(pointOfHouse, pointOfChicken))
        }
        chickenDistanceOfCity += distance
    }

    return chickenDistanceOfCity
}

func bt(_ selectedChickens: [Point], _ index: Int) { 
    if selectedChickens.count == m {
        answer = min(answer, countChickenDistanceOfCity(selectedChickens))
        return
    }
    for i in index..<pointsOfChicken.count { 
        bt(selectedChickens+[pointsOfChicken[i]], i+1)
    }
}

bt([], 0)
print(answer)
