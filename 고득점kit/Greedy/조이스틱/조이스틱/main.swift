let N = Int(readLine()!)!

var edges: [[Int]] = Array(repeating: [], count: N)
var parent = Array(repeating: 0, count: N)


for _ in 0..<N-1{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    edges[input[0]-1].append(input[1]-1)
    edges[input[1]-1].append(input[0]-1)
} // 그래프
let order = readLine()!.split(separator: " ").map{Int(String($0))!-1}

    
var q = [Int]()
var check = Array(repeating: false, count: N) // 방문 체크
q.append(0) // 1번 부터 시작
check[0] = true

var index = 1
var ans = [Int]()

func bfs() {
    for i in 0..<N{
//        if q.isEmpty{
//            print(0)
//            return
//        }
        let x = q.removeFirst()
        if x != order[i]{
        print(0)
        return
        }
        var cnt = 0
        for y in edges[x]{
            if check[y] == false{
                parent[y] = x
                cnt += 1
            }
        }
        for j in 0..<cnt{
            if parent[order[index+j]] != x{ // 부모를 기록해서 부모인지 확인하고 확인되면 오더 순서대로 큐에 넣어준다/.
                print(0)
                return
            }
            q.append(order[index+j])
            check[order[index+j]] = true
        }
        index += cnt
    }
    print(1)
    return
}

bfs()
