//
//  NetworkManaging.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

protocol NetworkManaging: AnyObject {
   
    func request<D: Decodable>(
        target: RequestTargetType,
        completion: @escaping (Result<D, Error>) -> Void
    )
}
