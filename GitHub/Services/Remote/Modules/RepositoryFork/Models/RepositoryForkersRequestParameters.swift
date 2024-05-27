//
//  RepositoryForkersRequestParameters.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct RepositoryForkersRequestParameters: Encodable {
    
    let user: String
    let repo: String
    let count: Int?
    
    init(
        user: String,
        repo: String,
        count: Int? = nil
    ) {
        self.user = user
        self.repo = repo
        self.count = count
    }
    
    enum CodingKeys: String, CodingKey {
        case count = "per_page"
    }
}
