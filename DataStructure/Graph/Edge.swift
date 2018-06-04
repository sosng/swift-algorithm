//
//  Edge.swift
//  Graph
//
//  Created by Shuang.Song on 2018/6/4.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

public enum EdgeType {
    case directed, undirected
}

public struct Edge<T>: Equatable where T: Equatable, T: Hashable {
    
    public let from: Vertex<T>
    public let to: Vertex<T>
    
    public let weight: Double?
    
}

extension Edge: Hashable {
    
    public var hashValue: Int {
        return "\(from)\(to)\(String(describing: weight))".hashValue
    }
    
    public static func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to && lhs.weight == rhs.weight
    }
}
