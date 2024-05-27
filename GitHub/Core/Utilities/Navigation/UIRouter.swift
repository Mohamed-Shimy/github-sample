//
//  UIRouter.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

class UIRouter<Destination: UINavigable> {
    
    // MARK: - Properties
    
    weak var viewController: UIViewController?
    
    // MARK: - init
    
    init(presenter: UIViewController? = nil) {
        self.viewController = presenter
    }
    
    // MARK: - Methods
    
    func navigate(to destination: Destination, animated: Bool = true) {
        if let navigationController = viewController as? UINavigationController {
            navigationController.pushViewController(destination.viewController, animated: animated)
        } else {
            viewController?.navigationController?.pushViewController(destination.viewController, animated: animated)
        }
    }
    
    func present(_ destination: Destination, animated: Bool = true) {
        viewController?.present(destination.viewController, animated: animated)
    }
}
