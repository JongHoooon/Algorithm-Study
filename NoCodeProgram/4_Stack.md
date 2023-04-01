# Stack

- `First` in `Last` out

## Valid Parents
- (), {}, []
- stack으로 생각

<br>

## min / max Stack
- 새로운 값이 추가될 때 마다 체크
  - O(n)
- max 명령어만을 위한 stack을 한개 더 만든다.
  - 시간: O(1), 공간: O(n)
  - (숫자, 갯수) 쌍을 사용해서 최적화 가능하다.


<br>

## Remove Adjacent Duplicates
- stack에 넣어서 마지막 element와 비교
  - 시간: O(n*k), 공간: O(n)
- 연속 갯수를 counting하는 stack 한개 더 생성
  - 시간: O(n), 공간: O(n)


<br>

## Decode String
- 2개의 스택 만든다. (문자 저장, 갯수 저장)

```swift
func decodeString(_ S: String) -> String {
    let inputChars: [Character] = Array(S)
    var stackStr: [String] = []
    var stackCount: [Int] = []
    var curNum: Int = 0
    var curStr: String = ""

    for c in inputChars {
        
        if c.isNumber {
            curNum = curNum * 10 + Int(String(c))!
            continue
        }

        if c.isLetter {
            curStr += String(c)
            continue
        }

        if c == "[" {
            stackStr.append(curStr)
            stackCount.append(curNum)

            curStr = ""
            curNum = 0
            continue
        }

        if c == "]" {
            var prevStr: String = stackStr.removeLast()
            let count = stackCount.removeLast()
            for _ in 0..<count {
                prevStr += curStr
            }

            curStr = prevStr
            continue
        }
    }
    return String(curStr)
}
```

<br>

## String Calculator
- Stack을 만들어서 /, * 가 오면 연산
  - 공간복잡도 O(n)
- +, * 만나면 계산해서 저장
  - 공간복잡도 O(1)

```swift
func calculate(s: String) -> Int {
    let s: [Character] = Array(s+"+")
    var stack: [Int] = []

    var curNum: Int = 0
    var prev_op: Character = "+"

    for c in s {
        if c.isNumber {
            curNum = curNum*10 + Int(String(c))!
        } else if c == " " {
            continue
        } else {
            if prev_op == "+" {
                stack.append(curNum)
            } else if prev_op == "-" {
                stack.append(-curNum)
            } else if prev_op == "*" {
                stack[stack.count-1] = stack.last! * curNum
            } else if prev_op == "/" {
                stack[stack.count-1] = stack.last! / curNum
            }
            curNum = 0
            prev_op = c
        }
    }

    return stack.reduce(0, +)
}

print(calculate(s: "7 - 6 / 3 + 3 * 2 + 4"))
// 15
```

<br>

## Distance To greater Number
- 뒤에서 부터 비교한다.
- 불필요한 정보는 pop한다.

```swift
func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    
    var stack: [(num: Int, index: Int)] = []
    var answer: [Int] = []
    
    for i in stride(from: temperatures.count-1, through: 0, by: -1) {
        let cur = temperatures[i]
        while !stack.isEmpty && stack.last!.num < cur {
            let _ = stack.popLast()
        }
            
        if stack.isEmpty {
            answer.append(0)
        } else {
            answer.append(stack.last!.index - i)
        }
        
        stack.append((cur, i))
    }
        
    return answer.reversed()
}

print(dailyTemperatures([39, 20, 70, 36, 30, 60, 80, 1]))
// [2, 1, 4, 2, 1, 1, 0, 0]
```

<br>

## 참고

- [코드없는 프로그래밍 - 코딩테스트 Stack](https://www.youtube.com/playlist?list=PLDV-cCQnUlIYQOb8_n-d-VPhl_X6cECjg)