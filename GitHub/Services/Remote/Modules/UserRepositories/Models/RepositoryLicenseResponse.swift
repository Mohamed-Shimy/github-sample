//
//  RepositoryLicenseResponse.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct RepositoryLicenseResponse: Decodable {
    
    let key: String?
    let name: String?
    let spdxId: String?
    let nodeId: String?
    
    enum CodingKeys: String, CodingKey {
        case key
        case name
        case spdxId = "spdx_id"
        case nodeId = "node_id"
    }
}
