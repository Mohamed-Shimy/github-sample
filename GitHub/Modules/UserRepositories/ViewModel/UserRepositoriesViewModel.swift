//
//  UserRepositoriesViewModel.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

class UserRepositoriesViewModel: UserRepositoriesViewModelProtocol {
    
    // MARK: - Properties
    
    let user: User
    let repositories = ValueSubject<[Repository]>([])
    let isLoading = PassSubject<Bool>()
    let errorMessage = PassSubject<String>()
    
    private let repositoriesRepo: UserRepositoriesRepositoryProtocol
    
    // MARK: - init
    
    init(
        user: User,
        repositoriesRepo: UserRepositoriesRepositoryProtocol = UserRepositoriesRepository()
    ) {
        self.user = user
        self.repositoriesRepo = repositoriesRepo
    }
    
    // MARK: - Methods
    
    func getRepositoriesList() {
        isLoading.send(true)
        repositoriesRepo.getRepositoriesList(for: user.login) { [weak self] result in
            guard let self else { return }
            
            switch result {
                case .success(let response):
                    let repositories = response.compactMap(Repository.init(response:))
                    self.repositories.send(repositories)
                    
                case .failure(let error):
                    errorMessage.send(error.localizedDescription)
            }
            
            isLoading.send(false)
        }
    }
    
    func getRepository(at indexPath: IndexPath) -> Repository {
        repositories.value[indexPath.row]
    }
}
