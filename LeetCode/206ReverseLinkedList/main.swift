//
//  main.swift
//  206ReverseLinkedList
//
//  Created by Shuang.Song on 2018/9/11.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

/*
 Reverse a singly linked list.
 
 Example:
 
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:
 
 A linked list can be reversed either iteratively or recursively. Could you implement both?
 

 */
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    func reverse(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var current = head
        var previous: ListNode? = nil
        var nextTemp: ListNode?
        
        while current != nil {
            nextTemp = current?.next
            current?.next = previous
            previous = current
            current = nextTemp
        }
        return head
    }
    
    
}
