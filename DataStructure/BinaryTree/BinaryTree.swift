//
//  main.swift
//  BinaryTree
//
//  Created by Sayaka on 2018/5/3.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Tree
// Binary Tree:
// a tree wher each node has 0, 1, 2 children.
// left or right child

public indirect enum BinaryTree<T: Comparable> {
    case empty
    case node(BinaryTree<T>, T, BinaryTree<T>)
}

extension BinaryTree {
    
    var count: Int {
        switch self {
        case .empty:
            return 0
        case let .node(left, _, right):
            return left.count + 1 + right.count
        }
    }
    
//   Traverse a binary tree
//    In-order(deep first)
//    Pre-order
//    Post-prder
    
    
    func traverseInorder(process: (T) -> Void) {
        switch self {
        case let .node(left, value, right):
            left.traverseInorder(process: process)
            process(value)
            right.traverseInorder(process: process)
        default:
            break
        }
    }
    
    func traversePreOrder(process: (T) -> Void) {
        switch self {
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        default:
            break
        }
    }
    
    func traversePostOrder(process: (T) -> Void) {
        switch self {
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        default:
            break
        }
    }
    
    
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case .empty:
            return ""
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description)], right= [\(right.description)]"
        }
    }
}


let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)

//print(tree)

