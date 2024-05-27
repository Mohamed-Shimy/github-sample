//
//  RepositoryLicense.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct RepositoryLicense: Hashable {
    
    let id: String
    let key: String
    let name: String
    let spdxId: String
}

extension RepositoryLicense {
    
    init?(response: RepositoryLicenseResponse?) {
        guard let response = response,
              let id = response.nodeId,
              let key = response.key
        else {
            return nil
        }
        
        self.init(
            id: id,
            key: key,
            name: response.name ?? key,
            spdxId: response.spdxId ?? key
        )
    }
}
