//
//  User.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct User: Hashable {
    
    let id: Int
    let login: String
    let avatarURL: String
    let url: String
    let name: String
    let company: String
    let email: String
    let bio: String
    let publicRepos: Int
    let followers: Int
}

extension User {
    
    init?(response: UserResponse) {
        guard let id = response.id,
              let login = response.login
        else {
            return nil
        }
        
        self.init(
            id: id,
            login: login,
            avatarURL: response.avatarURL ?? "",
            url: response.url ?? "",
            name: response.name ?? login,
            company: response.company ?? "",
            email: response.email ?? "",
            bio: response.bio ?? "",
            publicRepos: response.publicRepos ?? 0,
            followers: response.followers ?? 0
        )
    }
}
