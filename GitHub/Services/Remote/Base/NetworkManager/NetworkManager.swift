//
//  NetworkManager.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

class NetworkManager: NetworkManaging {
    
    // MARK: - Properties
    
    private let session: URLSession
    
    // MARK: - init
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - Methods
    
    func request<D: Decodable>(
        target: RequestTargetType,
        completion: @escaping (Result<D, Error>) -> Void
    ) {
        do {
            let builder = RequestBuilder(target: target)
            let request = try builder.build()
            
            let task = session.dataTask(with: request) { data, response, error in
                if let error {
                    completion(.failure(error))
                    return
                }
                
                let decoder = ResponseDecoder<D>(
                    data: data,
                    response: response
                )
                
                let result = decoder.decode()
                completion(result)
            }
            
            task.resume()
        } catch {
            completion(.failure(error))
        }
    }
}
