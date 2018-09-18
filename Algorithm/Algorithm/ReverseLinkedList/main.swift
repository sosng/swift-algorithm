//
//  main.swift
//  ReverseLinkedList
//
//  Created by Sayaka on 2018/9/10.
//  Copyright © 2018 songshuang. All rights reserved.
//

import Foundation

class ListNode {
    
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
}


func reverseListByIter(_ head: ListNode?) -> ListNode? {
    
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
    
    return previous
    
}
