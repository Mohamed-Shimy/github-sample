//
//  UserRepositoriesRepository.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

class UserRepositoriesRepository: NetworkRepository<UserRepositoriesAPI>, UserRepositoriesRepositoryProtocol {
    
    func getRepositoriesList(
        for user: String,
        completion: @escaping (Result<[RepositoryResponse], Error>) -> Void
    ) {
        let parameters = UserRepositoriesRequestParameters(user: user)
        request(
            target: .getRepositories(parameters),
            completion: completion
        )
    }
}
