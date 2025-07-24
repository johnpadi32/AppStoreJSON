//
//  ViewController.swift
//  AppStoreJSON
//
//  Created by John Padilla on 3/20/25.
//

import UIKit

class BaseTabBarController: UITabBarController {

    
    // 2 - refactor our repeated logic inside of viewDidLoad
    
    // 3 - maybe introduce our appSearchController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewControllers = [
            createNavController(viewController: AppsController(), title: "Apps", imageName: "Apps", image: "newspaper.fill"),
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "Search", image: "magnifyingglass"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "Today", image: "lineweight")

        ]
    }

    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String, image: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: image)
        
        return navController
        
    }

}

