//
//  AppDelegate.swift
//  Time to travel
//
//  Created by Андрей Рыбалкин on 31.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()
        
        let flightsListNavigationController = UINavigationController(rootViewController: FlightsListViewController())
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

        flightsListNavigationController.tabBarItem = UITabBarItem(title: "ПОИСК", image: UIImage(systemName: "airplane"), selectedImage: UIImage(systemName: "airplane"))
        flightsListNavigationController.tabBarItem.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any],for: .normal)
        
        flightsListNavigationController.navigationBar.titleTextAttributes = attributes
        flightsListNavigationController.navigationBar.topItem?.title = "ВЫБЕРИТЕ АВИАПЕРЕЛЕТ"
        flightsListNavigationController.navigationBar.barTintColor = UIColor.systemGray5
        flightsListNavigationController.navigationBar.standardAppearance = appearance
        flightsListNavigationController.navigationBar.scrollEdgeAppearance = flightsListNavigationController.navigationBar.standardAppearance
        
        tabBarController.viewControllers = [flightsListNavigationController, flightsListNavigationController]
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.layer.borderWidth = 1
        tabBarController.tabBar.layer.borderColor = UIColor.gray.cgColor

        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
        
    }
    
}
