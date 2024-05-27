//
//  UserRepositoriesAPI.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

enum UserRepositoriesAPI {
    
    case getRepositories(UserRepositoriesRequestParameters)
}

extension UserRepositoriesAPI: RequestTargetType, GitHubBaseTargetType {
    
    var path: String {
        switch self {
            case .getRepositories(let parameters):
                return Endpoint.users
                    .add(parameters.user)
                    .add(Endpoint.repos)
                    .value
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getRepositories: return .get
        }
    }
    
    var sampleDataJSONFile: String? {
        switch self {
            case .getRepositories(let parameters):
                let fileName = "\(parameters.user)-repos"
                return fileName
        }
    }
}
