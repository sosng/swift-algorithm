//
//  main.swift
//  15ThreeSum
//
//  Created by Shuang.Song on 2018/6/8.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

/*
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
[-1, 0, 1],
[-1, -1, 2]
]

*/
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var result = [[Int]]()
        let nums = nums.sorted(by: < )
        if nums.count <= 2 {
            return result
        }
        
        var start = 0
        var end = 0
        var sum = 0
        
        for i in 0...nums.count - 2 {
            if i == 0 || nums[i] != nums[i - 1] {
                start = i + 1
                end = nums.count - 1
                sum = 0 - nums[i]
                while start < end {
                    if nums[start] + nums[end] == sum {
                        result.append([nums[i], nums[start], nums[end]])
                        while start < end && nums[start] == nums[start + 1] {
                            start += 1
                        }
                        while start < end && nums[start] == nums[end - 1] {
                            end -= 1
                        }
                        start += 1
                        end -= 1
                    } else if nums[start] + nums[end] < sum {
                        start += 1
                    } else {
                        end -= 1
                    }
                }
            }
        }
        return result
    }
}
