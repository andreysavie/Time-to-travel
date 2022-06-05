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
        tabBarController.tabBar.tintColor = Colors.purpleColor
        
        let flightsListNavigationController = UINavigationController(rootViewController: FlightsListViewController())
        
        let infoViewController = InfoViewController()
        infoViewController.view.backgroundColor = .white
        let infoNavigationController = UINavigationController(rootViewController: infoViewController)


        let appearanceNavBar = UINavigationBarAppearance()
        appearanceNavBar.configureWithOpaqueBackground()
        appearanceNavBar.backgroundColor = .white
        
        let appearanceTabBar = tabBarController.tabBar.standardAppearance
        appearanceTabBar.stackedLayoutAppearance.selected.iconColor = Colors.purpleColor
        tabBarController.tabBar.standardAppearance = appearanceTabBar


        flightsListNavigationController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "airplane"), selectedImage: UIImage(systemName: "airplane"))
        flightsListNavigationController.tabBarItem.setTitleTextAttributes(Attributes.nabBarItemAttributes, for: .normal)
        
        flightsListNavigationController.navigationBar.titleTextAttributes = Attributes.navBarTitleTextAttributes
        flightsListNavigationController.navigationBar.topItem?.title = "Выберите авиаперелёт"
        flightsListNavigationController.navigationBar.barTintColor = UIColor.systemGray5
        flightsListNavigationController.navigationBar.standardAppearance = appearanceNavBar
        flightsListNavigationController.navigationBar.scrollEdgeAppearance = flightsListNavigationController.navigationBar.standardAppearance
        
        infoNavigationController.tabBarItem = UITabBarItem(
            title: "Информация",
            image: UIImage(systemName: "info.circle"),
            selectedImage: UIImage(systemName:"info.circle.fill"))
        infoNavigationController.navigationBar.topItem?.title = "Информация"
        infoNavigationController.navigationBar.barTintColor = UIColor.systemGray5
        infoNavigationController.navigationBar.standardAppearance = appearanceNavBar
        infoNavigationController.navigationBar.scrollEdgeAppearance = infoNavigationController.navigationBar.standardAppearance

        tabBarController.viewControllers = [flightsListNavigationController, infoNavigationController]
        tabBarController.tabBar.backgroundColor = .white
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
                
        return true
    }
    
    
    
}
