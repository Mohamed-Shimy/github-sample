//
//  UserRepositoriesViewModelProtocol.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

protocol UserRepositoriesViewModelProtocol: AnyObject {
    
    var user: User { get }
    var repositories: ValueSubject<[Repository]>  { get }
    var isLoading: PassSubject<Bool>  { get }
    var errorMessage: PassSubject<String>  { get }
    
    func getRepositoriesList()
    func getRepository(at indexPath: IndexPath) -> Repository
}
