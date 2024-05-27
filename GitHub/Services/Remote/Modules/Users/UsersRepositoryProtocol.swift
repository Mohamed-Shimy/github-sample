//
//  UsersRepositoryProtocol.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

protocol UsersRepositoryProtocol: AnyObject {
    
    func getUsersList(
        completion: @escaping (Result<[UserResponse], Error>) -> Void
    ) 
    
    func getNextPage(
        lastUserId: Int,
        completion: @escaping (Result<[UserResponse], Error>) -> Void
    )
}
