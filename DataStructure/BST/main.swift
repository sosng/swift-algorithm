//
//  main.swift
//  BST
//
//  Created by Shuang.Song on 2018/5/4.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

let t = BinarySearchTree(array: [7, 2, 5, 10, 9, 1])
print(t)
//print(t.search(value: 2))
//print(t)

print("============")
let e = t.search(value: 10)
e?.remove()
print(t)
