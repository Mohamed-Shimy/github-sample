//
//  RepositoryForkersViewModelProtocol.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

protocol RepositoryForkersViewModelProtocol: AnyObject {
    
    var repository: Repository { get }
    var forkers: ValueSubject<[User]> { get }
    var isLoading: PassSubject<Bool> { get }
    var errorMessage: PassSubject<String> { get }
    
    func getForkersList()
    func getForker(at indexPath: IndexPath) -> User
}
