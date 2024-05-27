//
//  ResponseDecoder.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

struct ResponseDecoder<D: Decodable> {
    
    // MARK: - Properties
    
    private let data: Data?
    private let response: URLResponse?
    
    // MARK: - init
    
    init(data: Data?, response: URLResponse?) {
        self.data = data
        self.response = response
    }
    
    // MARK: - Methods
    
    func decode() -> Result<D, Error> {
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(NetworkError.missingHTTPResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            // Handle server error
            let error = NetworkError(code: httpResponse.statusCode)
            return .failure(error)
        }
        
        return decodeData()
    }
    
    private func decodeData() -> Result<D, Error> {
        guard let data else {
            return .failure(NetworkError.missingData)
        }

        do {
            let decoder = JSONDecoder()
            
            // for debug only
            #if DEBUG
            let jsonString = data.prettyPrintedJSONString ?? ""
            print(response!.url!)
            print(jsonString)
            #endif
            
            let response = try decoder.decode(D.self, from: data)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
