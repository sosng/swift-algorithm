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


func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    let midIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<midIndex]))
    let rightArray = mergeSort(Array(array[midIndex..<array.count]))
    return merge(left: leftArray, right: rightArray)
}

let a = [1, 5, -10, 7, 3, 2]
let r = mergeSort(a)
print(r)
