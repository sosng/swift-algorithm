//
//  main.swift
//  CoutOccurrences
//
//  Created by Shuang.Song on 2018/5/22.
//  Copyright © 2018 songshuang. All rights reserved.
//

import Foundation

print("Hello, World!")

func occurrenceOfKey<T: Comparable>(_ key: T, in arr: [T]) -> Int {
    return upperBoundOfKey(key, in: arr) - lowerBoundOfKey(key, in: arr)
}

func lowerBoundOfKey<T: Comparable>(_ key: T, in arr: [T]) -> Int {
    var low = 0
    var high = arr.count
    while low < high {
        let mid = low + (high - low) / 2
        if arr[mid] < key {
            low = mid + 1
        } else {
            high = mid
        }
    }
    return low
}

func upperBoundOfKey<T: Comparable>(_ key: T, in arr: [T]) -> Int {
    var low = 0
    var high = arr.count
    while low < high {
        let mid = low + (high - low) / 2
        if arr[mid] > key {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}
