//
//  RepositoryForkAPI.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

enum RepositoryForkAPI {
    
    case getForkersList(RepositoryForkersRequestParameters)
}

extension RepositoryForkAPI: RequestTargetType, GitHubBaseTargetType {
    
    var path: String {
        switch self {
            case .getForkersList(let parameters):
                return Endpoint.repos
                    .add(parameters.user)
                    .add(parameters.repo)
                    .add(Endpoint.forks)
                    .value
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getForkersList: return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
            case .getForkersList(let parameters):
                return parameters.toDictionary
        }
    }
    
    var sampleDataJSONFile: String? {
        switch self {
            case .getForkersList(let parameters):
                let fileName = "\(parameters.user)-\(parameters.repo)-forks"
                return fileName
        }
    }
}
