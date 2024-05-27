//
//  AppDelegate.swift
//  GitHub
//
//  Created by Mohamed Shemy on 27/05/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        guard !CommandLine.arguments.contains(CommandLineArgumentKey.unitTest.rawValue) else {
            return true
        }
        
        return true
    }
}
