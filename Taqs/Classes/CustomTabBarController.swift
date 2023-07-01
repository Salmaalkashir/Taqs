//
//  CustomTabBarController.swift
//  Taqs
//
//  Created by Salma on 30/06/2023.
//

import UIKit

class CustomTabBarController : UITabBarController , UITabBarControllerDelegate
{
    func getColoredImage (color: UIColor, size : CGSize) -> UIImage
    {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        setupViewController()
        delegate = self
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().tintColor = .black
    }
    
    func setupViewController()
    {
        let first = templateNavController(rootViewController: MapsViewController(), image: UIImage(systemName: "map.fill") ?? UIImage())
        let second = templateNavController(rootViewController: HomeViewController(), image: UIImage(systemName: "circle.grid.2x1.fill") ?? UIImage())
        let third = templateNavController(rootViewController: FavouriteViewController(), image: UIImage(systemName: "star") ?? UIImage())
        viewControllers = [first,second,third]
        tabBar.backgroundImage = getColoredImage(color: .clear, size: CGSize(width: view.frame.width, height: 100))
    }
    
    
    func templateNavController(rootViewController: UIViewController, image: UIImage) -> UINavigationController
    {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        return navController
    }
}
