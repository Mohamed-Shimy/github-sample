//
//  EndpointPathGenerator.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

// MARK: - EndPointPathRepresentable

protocol EndPointPathRepresentable: RawRepresentable {
    
    var value: EndpointPath { get }
    var end: String { get }
}

extension EndPointPathRepresentable where RawValue == EndpointPath {
    
    var value: EndpointPath { rawValue }
    var end: String { rawValue.value }
    
    // MARK: - Builders
    
    func add(_ newPath: String) -> EndpointPath {
        value.add(newPath)
    }
    
    func parameter(key: String, value: String) -> EndpointPath.Parameter {
        self.value.parameter(key: key, value: value)
    }
}

// MARK: - Path

struct EndpointPath: RawRepresentable, Equatable, ExpressibleByStringLiteral {
    
    // MARK: - Properties
    
    private(set) var value: String
    var rawValue: String { value }
    
    // MARK: - init
    
    init(_ path: String) {
        value = path
    }
    
    init(rawValue: String) {
        self.init(rawValue)
    }
    
    init(stringLiteral value: String) {
        self.init(value)
    }
    
    // MARK: - Builders
        
    func add(_ newPath: String) -> EndpointPath {
        if newPath.starts(with: "/") {
            EndpointPath("\(value)\(newPath)")
        } else {
            EndpointPath("\(value)/\(newPath)")
        }
    }
    
    func add(_ newPath: EndpointPath) -> EndpointPath {
        self.add(newPath.value)
    }
    
    func add(_ newPath: any EndPointPathRepresentable) -> EndpointPath {
        self.add(newPath.end)
    }
    
    func parameter(key: String, value: String) -> Parameter {
        Parameter(self.value, key: key, value: value)
    }
}

// MARK: - Parameter

extension EndpointPath {
    
    struct Parameter {
        
        private(set) var value: String
        
        init(_ path: String, key: String, value: String) {
            let mark = path.contains("?") ? "&" : "?"
            self.value = "\(path)\(mark)\(key)=\(value)"
        }
        
        func parameter(key: String, value: String) -> Parameter {
            Parameter(self.value, key: key, value: value)
        }
    }
}
