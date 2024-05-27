//
//  Endpoint.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

enum Endpoint: EndpointPath, EndPointPathRepresentable {
    
    case users = "/users"
    case repos = "/repos"
    case forks = "/forks"
}
