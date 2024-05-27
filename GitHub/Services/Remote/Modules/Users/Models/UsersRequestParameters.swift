//
//  UsersRequest.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct UsersRequestParameters: Encodable {
    
    let since: Int
    let pageSize: Int
    
    enum CodingKeys: String, CodingKey {
        case since
        case pageSize = "per_page"
    }
}
