import Foundation

let input = readLine()!
    .components(separatedBy: " ")
    .map { Int($0)! }

let n = input[0]
let m = input[1]
var x = input[2]
var y = input[3]
let k = input[4]
 
var map: [[Int]] = []

 for _ in 0..<n { 
    let input = readLine()!
        .components(separatedBy: " ")
        .map { Int($0)! }
    map.append(input)
 }

var commands: [Int] = readLine()!
        .components(separatedBy: " ")
        .map { Int($0)!-1 }

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

var dice = Dice()

for command in commands { 

    let nx = x + dx[command]
    let ny = y + dy[command]
    
    guard 0..<n ~= nx else { continue }
    guard 0..<m ~= ny else { continue }

    x = nx
    y = ny
    map[x][y] = dice.move(command: command, value: map[x][y])
}

struct Dice { 
    private var top = 0
    private var bottom = 0
    private var left = 0
    private var right = 0
    private var back = 0
    private var front = 0
/*
      back 
left   top   right
      front
      bottom
*/
    /// - Parameters:
    ///     - command: 이동방향
    ///     - value: 움직인 위치의 값
    mutating func move(command: Int, value: Int) -> Int {
        let temp = (
            top: top,
            bottom: bottom,
            left: left,
            right: right,
            back: back,
            front: front
        )
        switch command { 
            case 0:
                top = temp.left
                bottom = temp.right
                left = temp.bottom
                right = temp.top
            case 1:
                top = temp.right
                bottom = temp.left
                left = temp.top
                right = temp.bottom
            case 2:
                top = temp.front
                bottom = temp.back
                back = temp.top
                front = temp.bottom
            case 3:
                top = temp.back
                bottom = temp.front
                back = temp.bottom
                front = temp.top
            default:
                break
        }
        
        print(top)

        if value == 0 { 
            return bottom
        } else { 
            bottom = value
            return 0
        }
    }
}
