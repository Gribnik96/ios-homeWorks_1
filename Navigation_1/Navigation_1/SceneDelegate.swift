//
//  SceneDelegate.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 25.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if #available(iOS 15, *) {
            setAppearance()
        }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
    
    private func setAppearance() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = .systemGray3
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .systemGray3
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    private func createFeedViewController() -> UIViewController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(
            title: "Лента",
            image: UIImage(systemName: "doc.richtext"),
            tag: 0
        )
        return UINavigationController(rootViewController: feedViewController)
    }
    
    private func createLogInViewController() -> UINavigationController {
        
        #if DEBUG
        let userService = CurrentUserService(
            user: User(
                login: "gribnik",
                userName: "Nikita",
                avatar: UIImage(named: "Dog"),
                status: "Ok",
                password: "123"
            )
        )
        #else
        let userService = TestUserService(
            user: User(
            login: "Ani",
            userName: "ANITA",
            avatar: UIImage(named: "Ani"),
            status: "Good",
            password: "111"
            )
        )
        #endif
        let logInViewController = LogInViewController(userService: userService)
        logInViewController.title = "Профиль"
        logInViewController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person.fill"),
            tag: 1)
        return UINavigationController(rootViewController: logInViewController)

    }
    
    private func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [createFeedViewController(),createLogInViewController() ]
        return tabBarController
    }
}

