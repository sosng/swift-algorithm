//
//  main.swift
//  70ClimbingStairs
//
//  Created by Shuang.Song on 2018/6/8.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation


/*
You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Note: Given n will be a positive integer.

Example 1:

Input: 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
Example 2:

Input: 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
*/

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var result = Array(repeating: 0, count: n)
        result[0] = 1
        if n >= 2 {
            result[1] = 2
            for i in 2..<n {
                result[i] = result[i - 1] + result[i - 2]
            }
        }

        return result[n - 1]
//        if n == 0 || n == 1 {
//            return 1
//        } else {
//            return climbStairs(n - 1) + climbStairs(n - 2)
//        }
    }
    
    
}

let r = Solution().climbStairs(100)
print(r)
