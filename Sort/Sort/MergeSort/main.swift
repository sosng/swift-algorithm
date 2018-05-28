//
//  main.swift
//  MergeSort
//
//  Created by Shuang.Song on 2018/5/28.
//  Copyright © 2018 songshuang. All rights reserved.
//

import Foundation
//O(n log n)


func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    // 1
    var leftIndex = 0
    var rightIndex = 0
    
    // 2
    var orderedPile = [T]()
    
    // 3
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            orderedPile.append(left[leftIndex])
            leftIndex += 1
        } else if left[leftIndex] > right[rightIndex] {
            orderedPile.append(right[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(left[leftIndex])
            leftIndex += 1
            orderedPile.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    // 4
    while leftIndex < left.count {
        orderedPile.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedPile.append(right[rightIndex])
        rightIndex += 1
    }
    return orderedPile
}

