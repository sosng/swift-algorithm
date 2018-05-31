//
//  main.swift
//  HashTable
//
//  Created by Shuang.Song on 2018/5/31.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

//https://github.com/raywenderlich/swift-algorithm-club/tree/master/Hash%20Table


public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var r = ListNode(0)
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0)
        let carry = sum >= 10 ? 1 : 0
        let value = sum >= 10 ? (sum - 10) : sum
        
        return r
    }
}
