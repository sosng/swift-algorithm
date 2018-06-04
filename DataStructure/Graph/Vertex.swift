//
//  Vertex.swift
//  Graph
//
//  Created by Shuang.Song on 2018/6/4.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

public struct Vertex<T>: Equatable where T: Equatable, T: Hashable {
    
    public var data: T
    
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
    
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}
