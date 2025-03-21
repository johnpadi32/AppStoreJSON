//
//  ViewController.swift
//  AppStoreJSON
//
//  Created by John Padilla on 3/20/25.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "Apps"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Apps"
        redNavController.tabBarItem.image = UIImage(systemName: "newspaper.fill")
        redNavController.navigationBar.prefersLargeTitles = true
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "Search"
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Search"
        blueNavController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        blueNavController.navigationBar.prefersLargeTitles = true

        
        viewControllers = [
            redNavController,
            blueNavController
        ]
    }


}

