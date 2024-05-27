//
//  NetworkError.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct NetworkError: LocalizedError {
    
    // MARK: - Properties
    
    let code: Int
    let message: String
    var errorDescription: String? { message }
    
    // MARK: - init
    
    init(_ code: Int, message: String) {
        self.code = code
        self.message = message
    }
    
    init(code: Int) {
        switch code {
            case 300...308: message = "Redirection"
            case 400: message = "Bad Request"
            case 401: message = "Unauthorized"
            case 403: message = "Forbidden"
            case 404: message = "Not Found"
            case 429: message = "You have hit your requests limit"
            case 500...599: message = "Internal Server Error"
            default: message = "Unknown error"
        }
        self.code = code
    }
}

extension NetworkError {
    
    static let missingData = NetworkError(0, message: "Missing data")
    
    static let missingHTTPResponse = NetworkError(0, message: "Missing http response")
}
