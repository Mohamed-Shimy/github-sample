//
//  UsersListViewModel.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import Foundation
import Combine

class UsersListViewModel: UsersListViewModelProtocol {
    
    // MARK: - Properties
    
    private let usersRepo: UsersRepositoryProtocol
    
    let users = ValueSubject<[User]>([])
    let usersLastPage = PassSubject<[User]>()
    let isLoading = ValueSubject<Bool>(false)
    let errorMessage = PassSubject<String>()
    
    // MARK: - init
    
    init(
        usersRepo: UsersRepositoryProtocol = UsersRepository()
    ) {
        self.usersRepo = usersRepo
    }
    
    // MARK: - Methods
    
    func getUsersList() {
        isLoading.send(true)
        usersRepo.getUsersList { [weak self] result in
            guard let self else { return }
            parseUsersResponse(result)
            isLoading.send(false)
        }
    }
    
    func getNextPage() {
        guard !isLoading.value else { return }
        guard let lastUserId = users.value.last?.id else { return }
        isLoading.send(true)
        usersRepo.getNextPage(lastUserId: lastUserId) { [weak self] result in
            guard let self else { return }
            parseUsersResponse(result)
            isLoading.send(false)
        }
    }
    
    func getUser(at indexPath: IndexPath) -> User {
        return users.value[indexPath.row]
    }
    
    private func parseUsersResponse(_ result: Result<[UserResponse], Error>) {
        switch result {
            case .success(let usersResponse):
                let users = usersResponse.compactMap(User.init(response:))
                self.users.value.append(contentsOf: users)
                usersLastPage.send(users)
                
            case .failure(let error):
                errorMessage.send(error.localizedDescription)
        }
    }
}
