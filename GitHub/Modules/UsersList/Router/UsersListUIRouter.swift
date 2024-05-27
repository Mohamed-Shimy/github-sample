//
//  UsersListUIRouter.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

class UsersListUIRouter: UIRouter<UsersListNavigationDestination> {
    
}

enum UsersListNavigationDestination: UINavigable {
    
    case userRepositories(UserRepositoriesViewModelProtocol)
    
    var viewController: UIViewController {
        switch self {
            case .userRepositories(let viewModel):
                return UserRepositoriesViewController(viewModel: viewModel)
        }
    }
}
