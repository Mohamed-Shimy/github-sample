//
//  UsersRepository.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

class UsersRepository: NetworkRepository<UsersAPI>, UsersRepositoryProtocol {
    
    // MARK: - Properties
    
    private let pageSize: Int
    
    // MARK: - init
    
    init(
        manager: NetworkManaging = NetworkManager(),
        pageSize: Int = 30
    ) {
        self.pageSize = pageSize
        super.init(manager: manager)
    }
    
    // MARK: - Methods
    
    func getUsersList(
        completion: @escaping (Result<[UserResponse], Error>) -> Void
    ) {
        let parameters = getRequestParameters()
        getUsersList(with: parameters, completion: completion)
    }
    
    func getNextPage(
        lastUserId: Int,
        completion: @escaping (Result<[UserResponse], Error>) -> Void
    ) {
        let parameters = getRequestParameters(lastId: lastUserId)
        getUsersList(with: parameters, completion: completion)
    }
    
    private func getUsersList(
        with parameters: UsersRequestParameters?,
        completion: @escaping (Result<[UserResponse], Error>) -> Void
    ) {
        request(
            target: .getUsersList(parameters),
            completion: completion
        )
    }
    
    private func getRequestParameters(lastId: Int = 0) -> UsersRequestParameters? {
        let parameters = UsersRequestParameters(
            since: lastId,
            pageSize: pageSize
        )
        return parameters
    }
}
