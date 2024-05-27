//
//  RepositoryForkersViewModel.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation

class RepositoryForkersViewModel: RepositoryForkersViewModelProtocol {
    
    // MARK: - Properties
    
    let repository: Repository
    let forkers = ValueSubject<[User]>([])
    let isLoading = PassSubject<Bool>()
    let errorMessage = PassSubject<String>()
    
    private let forkRepository: RepositoryForkRepositoryProtocol
    
    // MARK: - init
    
    init(
        repository: Repository,
        forkRepository: RepositoryForkRepositoryProtocol = RepositoryForkRepository()
    ) {
        self.repository = repository
        self.forkRepository = forkRepository
    }
    
    // MARK: - Methods
    
    func getForkersList() {
        guard repository.forksCount > 0 else {
            forkers.send([])
            return
        }
        
        isLoading.send(true)
        let parameter = RepositoryForkersRequestParameters(
            user: repository.owner.login,
            repo: repository.name,
            count: repository.forksCount
        )
        
        forkRepository.getForksList(parameter: parameter) { [weak self] result in
            guard let self else { return }
            
            switch result {
                case .success(let response):
                    let forkers = response.compactMap(User.init(response:))
                    self.forkers.send(forkers)
                    
                case .failure(let error):
                    errorMessage.send(error.localizedDescription)
            }
            
            isLoading.send(true)
        }
    }
    
    func getForker(at indexPath: IndexPath) -> User {
        forkers.value[indexPath.row]
    }
}
