//
//  main.swift
//  02AddTwoNumbers
//
//  Created by Shuang.Song on 2018/6/7.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
         self.val = val
         self.next = nil
      }
}

/*
extension ListNode: CustomStringConvertible {
    public var description: String {
        var next: ListNode? = self
        var str = ""
        while next != nil {
            str.append("\(val)->")
            next = self.next
        }
        return str
    }
}
*/

class Solution {
    class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0)
        var carry = sum / 10
        var reminder = sum % 10
        var result = ListNode(reminder)
        var temp = result

        var i1 = l1?.next
        var i2 = l2?.next
        while i1 != nil, i2 != nil {
            let sum = (i1?.val ?? 0) + (i2?.val ?? 0) + carry * 10
            carry = sum / 10
            reminder = sum % 10

            temp.next = ListNode(reminder)
            temp = temp.next!
            i1 = i1?.next
            i2 = i2?.next
        }

        return result.next
//        var carry = 0, sum = 0, l1 = l1, l2 = l2
//        var dummy = ListNode(0)
//        var node = dummy
//
//        while l1 != nil || l2 != nil || carry != 0 {
//            sum = carry
//
//            if l1 != nil {
//                sum += l1!.val
//                l1 = l1!.next
//            }
//            if l2 != nil {
//                sum += l2!.val
//                l2 = l2!.next
//            }
//
//            carry = sum / 10
//
//            node.next = ListNode(sum % 10)
//            node = node.next!
//        }
//
//        return dummy.next
//
    }
}

let l10 = ListNode(2)
let l11 = ListNode(4)
let l12 = ListNode(3)

l11.next = l12
l10.next = l11


let l20 = ListNode(5)
let l21 = ListNode(6)
let l22 = ListNode(4)

l21.next = l22
l20.next = l21

let r = Solution.addTwoNumbers(l10, l20)
print(r)



