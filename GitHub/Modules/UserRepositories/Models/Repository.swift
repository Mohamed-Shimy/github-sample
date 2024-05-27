//
//  Repository.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct Repository: Hashable {
   
    let id: Int
    let name: String
    let fullName: String
    let owner: User
    let description: String
    let forksCount: Int
    let license: RepositoryLicense?
}

extension Repository {
    
    init?(response: RepositoryResponse) {
        guard let id = response.id,
              let name = response.name,
              let ownerResponse = response.owner,
              let owner = User(response: ownerResponse)
        else {
            return nil
        }
        
        self.init(
            id: id,
            name: name,
            fullName: response.fullName ?? name,
            owner: owner,
            description: response.description ?? "",
            forksCount: response.forksCount ?? 0,
            license: RepositoryLicense(response: response.license)
        )
    }
}
