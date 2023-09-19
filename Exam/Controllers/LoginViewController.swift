//
//  ViewController.swift
//  Exam
//
//  Created by Phalkun Panha on 11/9/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView: LoginView!
    
    override func loadView() {
        super.loadView()
        loginView = LoginView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginView)
        
        loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-close"), style: .done, target: self, action: #selector(close))
        title = "Sign Up"
        
        loginView.delegate = self
    }
    @objc private func close() {
        dismiss(animated: true)
    }
}

extension LoginViewController: LoginViewDelegate {
    
    func onLogin(_ username: String, _ password: String) {
//        if(username == "Sing" && password == "1234") {
//            let vc = TabBarViewController()
//            let navc = UINavigationController(rootViewController: vc)
//            navc.modalPresentationStyle = .overFullScreen
//            present(navc, animated: true)
            
            let tabVC = TabBarViewController()
//            let tab1 = UIViewController()
//            let tab2 = UIViewController()
//            let tab3 = UIViewController()
            
//            tabVC.viewControllers = [tab1, tab2, tab3]
//            let proVC = ProViewController()
//            let noti = NotificationViewController()
            
//            let splitVC = UISplitViewController()
//            splitVC.preferredDisplayMode = .oneBesideSecondary
//            splitVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "house"), tag: 1)
//            
//            let homeVC = HomeViewController()
//            let primaryVC = UINavigationController(rootViewController: homeVC)
//            let secondaryVC = UIViewController()
//            secondaryVC.view.backgroundColor = .lightGray
//            
//            splitVC.viewControllers = [ primaryVC, secondaryVC ]
//            
//            tabVC.viewControllers = [splitVC, noti, proVC]
            
//            change to root
            let allScenes = UIApplication.shared.connectedScenes
            let scene = allScenes.first {$0.activationState == .foregroundActive}
            
            if let windowScene = scene as? UIWindowScene {
                windowScene.keyWindow?.rootViewController = tabVC
            }
//        }
    }
    
    func onSignup() {
        let vc = SignUpViewController()
        //        let navc = UINavigationController(rootViewController: vc)
        let navc = UINavigationController(rootViewController: vc)
        navc.modalPresentationStyle = .overFullScreen
        present(navc, animated: true)
    }
}

