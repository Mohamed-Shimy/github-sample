//
//  UserRepositoriesRepositoryProtocol.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

protocol UserRepositoriesRepositoryProtocol: AnyObject {
    
    func getRepositoriesList(
        for user: String,
        completion: @escaping (Result<[RepositoryResponse], Error>) -> Void
    )
}
