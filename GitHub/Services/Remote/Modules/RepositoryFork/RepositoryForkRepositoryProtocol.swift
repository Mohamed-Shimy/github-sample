//
//  RepositoryForkRepositoryProtocol.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

protocol RepositoryForkRepositoryProtocol: AnyObject {
    
    func getForksList(
        parameter: RepositoryForkersRequestParameters,
        completion: @escaping (Result<[UserResponse], Error>) -> Void
    ) 
}
