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

//import UIKit
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//    ) -> Bool {
//        true
//    }
//
//    // MARK: - UISceneSession Lifecycle
//
//    // ниже метод "связывающий" AppDelegate и SceneDelegate
//    func application(
//        _ application: UIApplication,
//        configurationForConnecting connectingSceneSession: UISceneSession,
//        options: UIScene.ConnectionOptions
//    ) -> UISceneConfiguration {
//        UISceneConfiguration(
//            name: "Default Configuration",
//            sessionRole: connectingSceneSession.role
//        )
//    }
//
//    func application(
//        _ application: UIApplication,
//        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
//    ) {}
//}
