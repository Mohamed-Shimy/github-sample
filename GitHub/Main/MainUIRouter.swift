//
//  MainUIRouter.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

class MainUIRouter: UIRouter<MainNavigationDestination> {
    
    // MARK: - Properties
    
    let window: UIWindow
 
    // MARK: - init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Method
    
    func prepareWindow() {
        let navigation = UINavigationController()
        window.rootViewController = navigation
        viewController = navigation
        window.makeKeyAndVisible()
    }
}
