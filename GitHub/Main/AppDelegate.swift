//
//  AppDelegate.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var router: MainUIRouter!
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        guard !CommandLine.arguments.contains(CommandLineArgumentKey.unitTest.rawValue) else {
            return true
        }
        
        launchUI()
        return true
    }
    
    private func launchUI() {
        window = UIWindow(frame: UIScreen.main.bounds)
        router = MainUIRouter(window: window!)
        router.prepareWindow()
        router.navigate(to: .usersList(UsersListViewModel()))
    }
}
