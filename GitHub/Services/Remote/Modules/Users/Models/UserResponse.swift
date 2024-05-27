//
//  UserResponse.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct UserResponse: Decodable {
    
    let login: String?
    let id: Int?
    let nodeId: String?
    let avatarURL: String?
    let url: String?
    let name: String?
    let company: String?
    let email: String?
    let bio: String?
    let publicRepos: Int?
    let followers: Int?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case url
        case name
        case company
        case email
        case bio
        case followers
        case nodeId = "node_id"
        case avatarURL = "avatar_url"
        case publicRepos = "public_repos"
    }
}
