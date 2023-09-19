//
//  TabBarViewController.swift
//  Exam
//
//  Created by Phalkun Panha on 12/9/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        
        let proVC = ProViewController()
        let proNavigationController = UINavigationController(rootViewController: proVC)
        
        let noti = NotificationViewController()
        let navigationController = UINavigationController(rootViewController: noti)
        
//        noti.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "bell"), style: .done, target: self, action: #selector(close))
        
        
        
//        viewControllers = [homeVC, noti, proVC]
        let splitVC = SplitViewController()
        splitVC.preferredDisplayMode = .oneBesideSecondary
        splitVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "house"), tag: 1)
        
//        let homeVC = HomeViewController()
        let primaryVC = UINavigationController(rootViewController: homeVC)
        let secondaryVC = UIViewController()
        secondaryVC.view.backgroundColor = .lightGray
        
        splitVC.viewControllers = [ primaryVC, secondaryVC ]
        
        viewControllers = [splitVC, navigationController, proNavigationController]
        
        title = "Tab"
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-close"), style: .done, target: self, action: #selector(close))
    }
    
    @objc private func close() {
        dismiss(animated: true)
    }

}
