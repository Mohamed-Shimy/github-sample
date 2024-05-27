//
//  NetworkRepository.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

class NetworkRepository<Target: RequestTargetType> {
    
    // MARK: - Properties
    
    let manager: NetworkManaging
    
    // MARK: - init
    
    init(
        manager: NetworkManaging = NetworkManager()
    ) {
        self.manager = manager
    }
    
    // MARK: - Methods
    
    func request<D: Decodable>(
        target: Target,
        completion: @escaping (Result<D, Error>) -> Void
    ) {
        manager.request(target: target, completion: completion)
    }
}
