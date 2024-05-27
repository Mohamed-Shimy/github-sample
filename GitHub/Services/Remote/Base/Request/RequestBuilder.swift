//
//  RequestBuilder.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct RequestBuilder {
    
    // MARK: - Properties
    
    private let target: RequestTargetType
    
    // MARK: - init
    
    init(target: RequestTargetType) {
        self.target = target
    }
    
    // MARK: - Methods
    
    func build() throws -> URLRequest {
        guard var components = URLComponents(string: target.baseURL) else {
            throw Error.cannotInitializeURLComponents
        }
        
        components.path = target.path
        if let parameters = target.parameters {
            components.queryItems = getURLQueryItems(from: parameters)
        }
        
        guard let url = components.url else {
            throw Error.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.allHTTPHeaderFields = target.headers

        return request
    }
    
    private func getURLQueryItems(
        from parameters: [String: Any]
    ) -> [URLQueryItem] {
        parameters.reduce(into: [URLQueryItem]()) {
            partialResult,
            parameter  in
            let queryItem = URLQueryItem(
                name: parameter.key,
                value: String(describing: parameter.value)
            )
            partialResult.append(queryItem)
        }
    }
}

extension RequestBuilder {
    
    enum Error: String, Swift.Error {
        
        case cannotInitializeURLComponents
        case invalidURL
    }
}
