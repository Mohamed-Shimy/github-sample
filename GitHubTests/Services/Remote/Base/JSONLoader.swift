//
//  JSONLoader.swift
//  GitHubTests
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation
@testable import GitHub

class JSONLoader {
    
    static func load<D: Decodable>(
        name: String,
        bundle: Bundle? = nil
    ) throws -> D {
        let bundle = bundle ?? Bundle(for: Self.self)
        guard let file = bundle.url(forResource: name, withExtension: "json") else {
            throw NetworkError(404, message: "Couldn't find \(name) in main bundle.")
        }
        
        let data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        return try decoder.decode(D.self, from: data)
    }
}
