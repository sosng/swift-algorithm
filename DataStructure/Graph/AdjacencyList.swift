//
//  AdjacencyList.swift
//  Graph
//
//  Created by Shuang.Song on 2018/6/4.
//  Copyright © 2018 Shuang.Song. All rights reserved.
//

import Foundation

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    fileprivate func addDirectEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(from: source, to: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    
    fileprivate func addUndirectEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectEdge(from: source, to: destination, weight: weight)
        addDirectEdge(from: source, to: destination, weight: weight)
    }
    
}

extension AdjacencyList: Graphable {
    
    public typealias Element = T

    var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.to),")
                } else {
                    edgeString.append("\(edge.to)")
                }
            }
            result.append("\(vertex) --> [\(edgeString)] \n")
        }
        return result
    }
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        return vertex
    }
    
    func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = adjacencyDict[source] else { return nil }
        for edge in edges {
            if edge.to == destination {
                return edge.weight
            }
        }
        return nil
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
    
}
