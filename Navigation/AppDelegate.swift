//
//  AppDelegate.swift
//  Navigation
//
//  Created by Нияз Нуруллин on 03.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let feedVC = FeedViewController()
        let loginVC = LogInViewController()

        let feedNC = UINavigationController(rootViewController: feedVC)
        let loginNC = UINavigationController(rootViewController: loginVC)

        feedNC.tabBarItem.title = "Feed"
        feedNC.tabBarItem.image = UIImage(systemName: "newspaper")

        loginNC.tabBarItem.title = "Profile"
        loginNC.tabBarItem.image = UIImage(systemName: "brain.head.profile")

        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [
            feedNC,
            loginNC
        ]
        tabBarVC.tabBar.backgroundColor = .white

        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()

        return true
    }

}
