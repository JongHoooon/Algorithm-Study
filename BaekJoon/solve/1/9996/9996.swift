
let n = Int(readLine()!)!
let pattern = readLine()!

let index = pattern.firstIndex(of: "*")!
let distance = pattern.distance(from: pattern.startIndex, to: index)

let pre = pattern.prefix(distance)
let suf = pattern.suffix(pattern.count - distance - 1)

for _ in 0..<n { 
  let input = readLine()!
  if input.count < pre.count + suf.count { 
    print("NE")
    continue
  }

  if input.prefix(pre.count) == pre && input.suffix(suf.count) == suf { 
    print("DA")
  } else { 
    print("NE")
  }
}