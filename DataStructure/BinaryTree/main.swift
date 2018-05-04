//
//  main.swift
//  BinaryTree
//
//  Created by Shuang.Song on 2018/5/4.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

tree.traverseInorder { print($0) }
var str = ""
var s0 = Stack<String>()

/*
 tree.traversePreOrder { node in
 if let _ = Int(node) {
 s0.push(node)
 } else if ("a"..."z" ~= node) || ("A"..."Z" ~= node) {
 s0.push(node)
 } else {
 let top2 = (s0.pop(), s0.pop())
 let e0 = top2.0 ?? ""
 let e1 = top2.1 ?? ""
 s0.push(e0 + node + e1)
 }
 }
 */
//print(s0)
//tree.traversePreOrder { print($0) }
