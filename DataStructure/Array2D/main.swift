//
//  main.swift
//  Array2D
//
//  Created by Sayaka on 2018/5/3.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

public struct Array2D<T> {
    
    public let columns: Int
    public let rows: Int
    private var array: [T]
    
    public init(columns: Int, rows: Int, initialValue: T) {
        self.columns = columns
        self.rows = rows
        self.array = Array.init(repeating: initialValue, count: rows * columns)
    }
    
    subscript(column: Int, row: Int) -> T {
        set {
            precondition(column < columns, "Colum \(column) is out of range.")
            precondition(row < rows, "Row \(row) is out of range.")
            array[row * columns + column] = newValue
        }
        get {
            precondition(column < columns, "Colum \(column) is out of range.")
            precondition(row < rows, "Row \(row) is out of range.")
            return array[row * columns + column]
        }
    }
    
    
 
}
