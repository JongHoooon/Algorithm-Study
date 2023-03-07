//
//  main.swift
//  테이블 해시 함수
//
//  Created by JongHoon on 2023/03/07.
//

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    let data = data.sorted(by: {
        if $0[col-1] == $1[col-1] { return $0[0] > $1[0] }
        else { return $0[col-1] < $1[col-1] }
    })
    
    var arr: [Int] = []
    for i in row_begin-1...row_end-1 {
        var sum: Int = 0
        for n in data[i] {
            sum += n%(i+1)
        }
        arr.append(sum)
    }
    
    return arr.reduce(0, ^)
}

print(solution([[2,2,6],[1,5,10],[4,2,9],[3,8,3]], 2, 2, 3))
