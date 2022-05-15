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
        let profileVC = ProfileViewController()


        let feedNC = UINavigationController(rootViewController: feedVC)
        let profileNC = UINavigationController(rootViewController: profileVC)

        feedNC.tabBarItem.title = "Feed"
        feedNC.tabBarItem.image = UIImage(systemName: "newspaper")

        profileNC.tabBarItem.title = "Profile"
        profileNC.tabBarItem.image = UIImage(systemName: "brain.head.profile")

        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [
            feedNC,
            profileNC
        ]

        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()

        return true
    }

}
