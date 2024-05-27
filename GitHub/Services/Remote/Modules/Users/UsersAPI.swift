//
//  UsersAPI.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

enum UsersAPI {
    
    case getUsersList(UsersRequestParameters? = nil)
}

extension UsersAPI: RequestTargetType, GitHubBaseTargetType {
    
    var path: String {
        switch self {
            case .getUsersList:
                return Endpoint.users.end
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getUsersList: return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
            case .getUsersList(let parameters):
                return parameters?.toDictionary
        }
    }
    
    var sampleDataJSONFile: String? {
        switch self {
            case .getUsersList(let parameters):
                if let parameters {
                    let fileName = "users-\(parameters.since)"
                    return fileName
                } else {
                    return nil
                }
        }
    }
}
