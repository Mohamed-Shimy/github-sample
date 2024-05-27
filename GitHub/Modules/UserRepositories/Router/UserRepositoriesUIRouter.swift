//
//  UserRepositoriesUIRouter.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

class UserRepositoriesUIRouter: UIRouter<UserRepositoriesNavigationDestination> {
    
}

enum UserRepositoriesNavigationDestination: UINavigable {
    
    case repositoryForkers(RepositoryForkersViewModelProtocol)
    
    var viewController: UIViewController {
        switch self {
            case .repositoryForkers(let viewModel):
                return RepositoryForkersViewController(viewModel: viewModel)
        }
    }
}
