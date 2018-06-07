//
//  main.swift
//  88MergeSortedArray
//
//  Created by Shuang.Song on 2018/6/7.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1
    var j = n - 1
    var k = m + n - 1
    while (i >= 0 && j >= 0) {
        if nums1[i] > nums2[j] {
            nums1[k] = nums1[i]
            k -= 1
            i -= 1
        } else {
            nums1[k] = nums2[j]
            k -= 1
            j -= 1
        }
    }
    while j >= 0 {
        nums1[k] = nums2[j]
        k -= 1
        j -= 1
    }
}

var nums1 = [-1, 6, 10, 12, 18, 20, 0, 0]
let nums2 = [-2, 15, 20, 29]
merge(&nums1, 4, nums2, 3)
print(nums1)
