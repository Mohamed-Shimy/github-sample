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
    
    case repositoryForkers
    
    var viewController: UIViewController {
        switch self {
            case .repositoryForkers:
                return UIViewController()
        }
    }
}
