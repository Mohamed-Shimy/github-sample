//
//  MainUINavigationDestination.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

enum MainNavigationDestination: UINavigable {
    
    case usersList(UsersListViewModelProtocol)
    
    var viewController: UIViewController {
        switch self {
            case .usersList(let viewModel):
                return UsersListViewController(viewModel: viewModel)
        }
    }
}
