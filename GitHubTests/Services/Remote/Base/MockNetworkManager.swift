//
//  MockNetworkManager.swift
//  GitHubTests
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation
@testable import GitHub

class MockNetworkManager: NetworkManaging {
    
    func request<D: Decodable>(
        target: RequestTargetType,
        completion: @escaping (Result<D, Error>) -> Void
    ) {
        guard let fileName = target.sampleDataJSONFile else {
            completion(.failure(NetworkError(code: 400)))
            return
        }
        
        do {
            let response: D = try JSONLoader.load(name: fileName)
            completion(.success(response))
        } catch {
            completion(.failure(error))
        }
    }
}
