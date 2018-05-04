//
//  BST.swift
//  BST
//
//  Created by Shuang.Song on 2018/5/4.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation
// BST : Binary Search Tree
//https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search%20Tree
//https://www.raywenderlich.com/139821/swift-algorithm-club-swift-binary-search-tree-data-structure
// each left child is smaller than its parent node ,
// each right child is greater than its parent node
//           7
//          / \
//         /   \
//        /     \
//       2      10
//      / \    /
//     /   \  9
//    1     5



extension BinaryTree {
    
    mutating func insert(newValue: T) -> BinaryTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case .node(var left, let value, var right):
            if newValue > value {
                return right.insert(newValue: newValue)
            } else {
                return left.insert(newValue: newValue)
            }
        }
    }
}

public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left?.value == self.value
//        if parent?.left == nil {
//            return false
//        } else if let left = parent?.left {
//            return left == self
//        }
    }
    
    public var isRightChild: Bool {
        return parent?.right?.value == self.value
//        if parent?.right == nil {
//            return false
//        } else if let right = parent?.right {
//            return right == self
//        }
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
}


extension BinarySearchTree {
    
    public func insert(newValue: T) {
        if newValue < self.value {
            if hasLeftChild {
                left?.insert(newValue: newValue)
            } else {
                left = BinarySearchTree(value: newValue)
                left?.parent = self
            }
        } else {
            if hasRightChild {
                right?.insert(newValue: newValue)
            } else {
                right = BinarySearchTree(value: newValue)
                right?.parent = self
            }
        }
    }
    
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for e in array.dropFirst() {
            insert(newValue: e)
        }
    }
    
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

extension BinarySearchTree {
    
    func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value: value)
        } else if value > self.value {
            return right?.search(value: value)
        } else {
            return self
        }
    }
   
    
}


