//
//  main.swift
//  BinarySearch
//
//  Created by Shuang.Song on 2018/5/22.
//  Copyright © 2018 songshuang. All rights reserved.
//

import Foundation

func binarySearch<T: Comparable>(arr: [T], key: T) -> Int? {
    var lowerbound = 0
    var upperbound = arr.count
    
    while lowerbound < upperbound {
        let midIndex = lowerbound + (upperbound - lowerbound) / 2
        if arr[midIndex] == key {
            return midIndex
        } else if arr[midIndex] < key {
            lowerbound = midIndex + 1
        } else {
            upperbound = midIndex
        }
    }
    return nil
}

let nums = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

let idx = binarySearch(arr: nums, key: 2)
print(idx)



