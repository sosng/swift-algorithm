//
//  main.swift
//  Queue
//
//  Created by Shuang.Song on 2018/5/3.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

struct Queue<T> {
    
    private var array = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var front: T? {
        return array.first
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
}
