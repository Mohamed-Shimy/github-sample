//
//  RepositoryForkRepository.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

class RepositoryForkRepository: NetworkRepository<RepositoryForkAPI>, RepositoryForkRepositoryProtocol {
    
    func getForksList(
        parameter: RepositoryForkersRequestParameters,
        completion: @escaping (Result<[UserResponse], Error>) -> Void
    ) {
        request(
            target: .getForkersList(parameter)
        ) { (result: Result<[RepositoryForkerResponse], Error>) in
            switch result {
                case .success(let response):
                    let forkers = response.compactMap(\.owner)
                    completion(.success(forkers))
                    
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
