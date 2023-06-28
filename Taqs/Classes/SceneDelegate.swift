//
//  SceneDelegate.swift
//  Taqs
//
//  Created by Salma on 14/06/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

            // let viewController = UIViewController()
            // viewController.view.backgroundColor = .systemTeal

             let window = UIWindow(windowScene: windowScene)
             window.rootViewController = createTabBar()
             window.makeKeyAndVisible()

             self.window = window
    }
    func createHomeNC() -> UINavigationController{
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "circle.grid.2x1.fill"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    func createFavouriteNC() -> UINavigationController{
        let favouriteVC = FavouriteViewController()
        favouriteVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "star"), tag: 0)
        return UINavigationController(rootViewController: favouriteVC)
    }
    func createTabBar() -> UITabBarController{
        let tabBar = UITabBarController()
        let tabBarApperance = UITabBarAppearance()
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().backgroundColor = .clear
        UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
        tabBarApperance.backgroundColor = UIColor(named: "blueeee")
        UITabBar.appearance().standardAppearance = tabBarApperance
        tabBar.viewControllers = [createHomeNC(),createFavouriteNC()]
        return tabBar
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

