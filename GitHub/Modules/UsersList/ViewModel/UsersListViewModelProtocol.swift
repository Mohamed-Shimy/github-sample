//
//  UsersListViewModelProtocol.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

protocol UsersListViewModelProtocol: AnyObject {
    
    var users: ValueSubject<[User]> { get }
    var usersLastPage: PassSubject<[User]> { get }
    var isLoading: ValueSubject<Bool> { get }
    var errorMessage: PassSubject<String> { get }
    
    func getUsersList()
    func getNextPage()
    func getUser(at indexPath: IndexPath) -> User
}
