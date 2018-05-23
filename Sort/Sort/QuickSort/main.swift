//
//  main.swift
//  QuickSort
//
//  Created by Sayaka on 2018/5/22.
//  Copyright © 2018 songshuang. All rights reserved.
//

import Foundation

print("Hello, World!")

func quickSort0< T: Comparable>(_ arr: [T]) -> [T] {
    
    guard arr.count > 1 else { return arr }
    
    let pivot = arr[arr.count / 2]
    let less = arr.filter{ $0 < pivot }
    let equal = arr.filter{ $0 == pivot }
    let greater = arr.filter{ $0 > pivot }
    
    return quickSort0(greater) + equal + quickSort0(less)
}


//let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
//print("re0 = \(quickSort0(list))")

func partition<T: Comparable>(_ a: inout [T], left: Int, right: Int) -> Int {
    
    var i = left
    var j = right
    let pivot = a[left]
    
    while i < j {
        while i < j && a[j] > pivot {
            j -= 1
            if i < j {
                a[i] = a[j]
                i += 1
            }
        }
        
        while i < j && a[j] < pivot {
            i += 1
            if i < j {
                a[j] = a[i]
                j -= 1
            }
        }
    }
    
    a[i] = pivot
    return i
}


func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    
    let pivot = a[high]
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }
    (a[i], a[high]) = (a[high], a[i])
    return i
}


func quickSortLumuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    print("temp: \(a)")
    if low < high {
        let p = partitionLomuto(&a, low: low, high: high)
        print("p: \(p)")
//        let p = partition(&a, left: low, right: high)
        quickSortLumuto(&a, low: low, high: p - 1)
        quickSortLumuto(&a, low: p + 1, high: high)
    }
}

func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot
        if i < j {
            (a[i], a[j]) = (a[j], a[i])
        } else {
            return j
        }
    }
}

var list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
quickSortLumuto(&list, low: 0, high: list.count - 1)
print("re: \(list)")


