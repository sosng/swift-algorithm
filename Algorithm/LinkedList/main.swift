//
//  main.swift
//  LinkedList
//
//  Created by Shuang.Song on 2018/5/3.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

class LinkedListNode<T> {
    
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
    
}


class LinkedList<T>{
  
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public subscript(index: Int) -> T? {
        return node(atIndex: index)?.value
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let _ = last {

        }
        if let _ = last {
//            lastNode.next = newNode
//            newNode.previous = lastNode
            newNode.previous = last
            last?.next = newNode
        } else {
            head = newNode
        }
    }
    
    public func node(atIndex index: Int) -> Node? {
        if index == 0 {
            return head
        }
        var node = head?.next
        for _ in 1..<index {
            node = node?.next
            if node == nil {
                break
            }
        }
        return node
    }
    
    public func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let previusNodeToInsert = self.node(atIndex: index - 1)
            let nextNodeToInsert = previusNodeToInsert?.next
            
            newNode.previous = previusNodeToInsert
            newNode.next = nextNodeToInsert
            
            previusNodeToInsert?.next = newNode
            nextNodeToInsert?.previous = newNode
        }
    }
    
    public func insert(value: T, atIndex index: Int) {
        insert(Node(value: value), atIndex: index)
    }
    
    public func removeAll() {
        head = nil
    }
    
    public func remove(_ node: Node) -> T {
        let prevNode = node.previous
        let nextNode = node.next
        if let prev = prevNode {
            prev.next = nextNode
        } else {
            head = nextNode
        }
        nextNode?.previous = prevNode
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    public func removeLast() -> T {
        return remove(last!)
    }
    
    public func removeAt(_ index: Int) -> T {
        return remove(node(atIndex: index)!)
    }
    
    public func reverse() {
        var node = head
        while let currentNode = node {
            node = currentNode.next
            let temp = currentNode.next
            currentNode.next = currentNode.previous
            currentNode.previous = temp
            head = currentNode
        }
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node?.next
            if node != nil {
                s += ","
            }
            
        }
        s += "]"
        return s
    }
}


let l = LinkedList<String>()
//let n0 = LinkedListNode<String>("Hello")
l.append(value: "Hello")
l.append(value: "World")
l.append(value: "Linked")
l.append(value: "List")

//print(l.first?.next?.value)
//print(l.last?.previous?.value)
//print("value at 3: \(l.node(atIndex: 3)?.value)")


print(l)


print("==============")
l.insert(value: "Again", atIndex: 2)
print(l)
print("==============")

l.removeAt(4)
print(l)
print("==============")

l.reverse()
print(l)


