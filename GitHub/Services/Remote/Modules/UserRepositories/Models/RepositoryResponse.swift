//
//  RepositoryResponse.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct RepositoryResponse: Decodable {
    
    let id: Int?
    let nodeId: String?
    let name: String?
    let fullName: String?
    let welcomePrivate: Bool?
    let owner: UserResponse?
    let description: String?
    let watchersCount: Int?
    let language: String?
    let forksCount: Int?
    let license: RepositoryLicenseResponse?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case description
        case language
        case license
        case nodeId = "node_id"
        case fullName = "full_name"
        case welcomePrivate = "private"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
    }
}
