//
//  main.swift
//  Stack
//
//  Created by Shuang.Song on 2018/5/3.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation


// Stack: Last In First Out (LIFO)
struct Stack<T> {
    
    private var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public func top() -> T? {
        return array.last
    }
    
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var aself = self
        return AnyIterator({
            return aself.pop()
        })
    }
}

/*
var s = Stack<Int>()

for i in 0...10 {
    s.push(i)
}

for p in s {
    print(p)
}

for _ in 0...10 {
    print(s.pop())
}



*/
