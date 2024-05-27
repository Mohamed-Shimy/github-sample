//
//  GitHubBaseTargetType.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

protocol GitHubBaseTargetType {
    
}

extension GitHubBaseTargetType {
    
    var baseURL: String {
        "https://api.github.com"
    }
    
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
}
