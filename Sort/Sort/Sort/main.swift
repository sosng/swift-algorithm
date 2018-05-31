//
//  main.swift
//  Sort
//
//  Created by Sayaka on 2018/5/22.
//  Copyright © 2018 songshuang. All rights rerved.
//

import Foundation

print("Hello, World!")

func sprialOrder(_ matrix: [[Int]]) -> [Int] {
    var r = [Int]()
    
    guard matrix.count != 0 else {
        return r
    }
    
    var startX = 0
    var startY = 0
    var endX = matrix.count - 1
    var endY = matrix[0].count - 1
    
    while true {
        for i in startY...endY {
            r.append(matrix[startX][i])
        }
        startX += 1
        if startX > endX {
            break
        }
        for i in startX...endX {
            r.append(matrix[i][endY])
        }
        endY -= 1
        if startY > endY {
            break
        }
        for i in (startY...endY).reversed() {
            r.append(matrix[endX][i])
        }
        endX -= 1
        if startX > endX {
            break
        }
        for i in (startX...endX).reversed() {
            r.append(matrix[i][startY])
        }
        startY += 1
        if startY > endY {
            break
        }
    }
    return r
}

let m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let a = sprialOrder(m)
print(a)

