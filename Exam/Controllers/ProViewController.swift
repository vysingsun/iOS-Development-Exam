//
//  ProViewController.swift
//  Exam
//
//  Created by Phalkun Panha on 13/9/23.
//

import UIKit

class ProViewController: UIViewController {

    private var userLabel: UILabel!
    
    private var profileImg: UIImageView!
    
    private var content1: UIView!
    private var content2: UIControl!
    
    private var controlFb: UIControl!
    
    private var fbImg: UIImageView!
    private var fblabel: UILabel!
    
    private var tgControl: UIControl!
    private var tgLabel: UILabel!
    private var tgImg: UIImageView!
    
    private var gmLabel: UILabel!
    private var gmImg: UIImageView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileimg"), tag: 20)
        
        
        userLabel = UILabel()
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.text = "Username"
        userLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        profileImg = UIImageView()
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        profileImg.image = UIImage(named: "users")
        
        content1 = UIView()
        content1.translatesAutoresizingMaskIntoConstraints = false
        
        tgControl = UIControl()
        tgControl.translatesAutoresizingMaskIntoConstraints = false
        tgControl.addTarget(self, action: #selector(openTg), for: .touchUpInside)
        
        
        controlFb = UIControl()
        controlFb.translatesAutoresizingMaskIntoConstraints = false
        controlFb.addTarget(self, action: #selector(openFb), for: .touchUpInside)
        
        
        fbImg = UIImageView()
        fbImg.translatesAutoresizingMaskIntoConstraints = false
        fbImg.image = UIImage(named: "facebook")
        
        fblabel = UILabel()
        fblabel.translatesAutoresizingMaskIntoConstraints = false
        fblabel.text = "Facebook"
        fblabel.textColor = .blue
        fblabel.font = UIFont.boldSystemFont(ofSize: 17)
//
        tgLabel = UILabel()
        tgLabel.translatesAutoresizingMaskIntoConstraints = false
        tgLabel.text = "Telegram"
        tgLabel.textColor = .black
        tgLabel.font = UIFont.boldSystemFont(ofSize: 17)

        tgImg = UIImageView()
        tgImg.translatesAutoresizingMaskIntoConstraints = false
        tgImg.image = UIImage(named: "telegram")
        
        content2 = UIControl()
        content2.translatesAutoresizingMaskIntoConstraints = false
        content2.addTarget(self, action: #selector(openGooglemap), for: .touchUpInside)
        
        gmLabel = UILabel()
        gmLabel.translatesAutoresizingMaskIntoConstraints = false
        gmLabel.text = "Google Maps"
        gmLabel.textColor = .blue
        gmLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        gmImg = UIImageView()
        gmImg.translatesAutoresizingMaskIntoConstraints = false
        gmImg.image = UIImage(named: "google-maps")
        
        view.addSubview(userLabel)
        view.addSubview(profileImg)
        
        view.addSubview(content1)
        view.addSubview(content2)
        
        content1.addSubview(controlFb)
        content1.addSubview(tgControl)
        
        controlFb.addSubview(fbImg)
        controlFb.addSubview(fblabel)
        tgControl.addSubview(tgLabel)
        tgControl.addSubview(tgImg)
        
        content2.addSubview(gmLabel)
        content2.addSubview(gmImg)
        
        userLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        profileImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImg.heightAnchor.constraint(equalToConstant: 150).isActive = true
        profileImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImg.bottomAnchor.constraint(equalTo: userLabel.topAnchor,constant: -20).isActive = true
        
        profileImg.layer.masksToBounds = true
        
        content1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        content1.topAnchor.constraint(equalTo: userLabel.bottomAnchor,constant: 45).isActive = true
        content1.widthAnchor.constraint(equalToConstant: 300).isActive = true
        content1.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        controlFb.topAnchor.constraint(equalTo: content1.topAnchor).isActive = true
        controlFb.bottomAnchor.constraint(equalTo: content1.bottomAnchor).isActive = true
        controlFb.leadingAnchor.constraint(equalTo: content1.leadingAnchor).isActive = true
        controlFb.trailingAnchor.constraint(equalTo: fblabel.trailingAnchor).isActive = true
        
        tgControl.topAnchor.constraint(equalTo: content1.topAnchor).isActive = true
        tgControl.bottomAnchor.constraint(equalTo: content1.bottomAnchor).isActive = true
        tgControl.trailingAnchor.constraint(equalTo: content1.trailingAnchor).isActive = true
        tgControl.leadingAnchor.constraint(equalTo: tgImg.leadingAnchor).isActive = true
        
        fbImg.centerYAnchor.constraint(equalTo: controlFb.centerYAnchor).isActive = true
        fbImg.leadingAnchor.constraint(equalTo: controlFb.leadingAnchor).isActive = true
//
        fblabel.centerYAnchor.constraint(equalTo: controlFb.centerYAnchor).isActive = true
        fblabel.leadingAnchor.constraint(equalTo: fbImg.trailingAnchor,constant: 10).isActive = true
//
        tgLabel.centerYAnchor.constraint(equalTo: tgControl.centerYAnchor).isActive = true
        tgLabel.trailingAnchor.constraint(equalTo: tgControl.trailingAnchor).isActive = true
//
        tgImg.centerYAnchor.constraint(equalTo: tgControl.centerYAnchor).isActive = true
        tgImg.trailingAnchor.constraint(equalTo: tgLabel.leadingAnchor,constant: -10).isActive = true
        
        content2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        content2.topAnchor.constraint(equalTo: content1.bottomAnchor,constant: 20).isActive = true
        content2.widthAnchor.constraint(equalToConstant:300).isActive = true
        content2.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        gmImg.centerYAnchor.constraint(equalTo: content2.centerYAnchor).isActive = true
        gmImg.leadingAnchor.constraint(equalTo: content2.leadingAnchor).isActive = true
        
        gmLabel.centerYAnchor.constraint(equalTo: content2.centerYAnchor).isActive = true
        gmLabel.leadingAnchor.constraint(equalTo: gmImg.trailingAnchor,constant: 10).isActive = true
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        profileImg.layer.cornerRadius = profileImg.frame.width / 2
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(share))
    }
    
    @objc func openGooglemap() {
//        print("GoogleMaps")
//        let url = URL(string: "comgooglemaps://?daddr=\(11.564181),\(104.886422)")!
////        let url = URL(string: "comgooglemaps://")!
//        if UIApplication.shared.canOpenURL(url) {
//            print("My Phone have App Google Maps!")
//            UIApplication.shared.open(url)
//        }else {
//            let url = URL(string: "https://itunes.apple.com/us/app/google-maps-transit-food/id585027354")!
//            print("My Phone does not have App Google Maps!")
//            UIApplication.shared.open(url)
//        }
        
        let googleMapsURLString = "comgooglemaps://"
        let appleMapsURLString = "http://maps.apple.com/?q="

        if let googleMapsURL = URL(string: googleMapsURLString) {
            if UIApplication.shared.canOpenURL(googleMapsURL) {
                // Google Maps is installed, open the URL
                UIApplication.shared.open(googleMapsURL, options: [:], completionHandler: nil)
            } else {
                // Google Maps is not installed, open Apple Maps as fallback
                let address = "Phnom Penh, Cambodia" // Replace with your desired address or coordinates
                let formattedAddress = address.replacingOccurrences(of: " ", with: "+")
                if let appleMapsURL = URL(string: "\(appleMapsURLString)\(formattedAddress)") {
                    UIApplication.shared.open(appleMapsURL, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    @objc private func openFb() {
        print("Fb")
    }
    
    @objc private func openTg() {
        print("Tg")
    }
    
    @objc func rightBarButtonTapped() {
            // Handle the tap on the right bar button item here
    }
    
    @objc private func share() {
        
        let alert = UIAlertController(title: "Logout ?", message: "Are you sure?", preferredStyle: .alert)
        
        let okBtn = UIAlertAction(title: "Okay", style: .default) { _ in
            let loginVC = LoginViewController()
            
            let allScenes = UIApplication.shared.connectedScenes
            let scene = allScenes.first { $0.activationState == .foregroundActive }
            
            if let windowScene = scene as? UIWindowScene {
                windowScene.keyWindow?.rootViewController = loginVC
            }
        }
        
//        okBtn.tintColor = UIColor(hexString: "000000")
        
        let cancelBtn  = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelBtn)
        alert.addAction(okBtn)
        present(alert, animated: true)
    }
}
