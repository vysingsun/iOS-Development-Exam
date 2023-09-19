//
//  HomeViewController.swift
//  Exam
//
//  Created by Phalkun Panha on 13/9/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var items = ["🎾  TableView", "⚙️ Collention View", "🔧 Activity View", "🏙️ Image View", "🌅 Page", "🌠 Popovers", "⛲️ Spit View", "💡 Text View", "🏝️ Web View"]
    
    private var uikitDoc = [["🍏 Table view", "⚙️ Collection view", "🔧 Activity view", "🏙 Image view", "🌅 Pages", "🌠 Popovers", "⛲️ Spit view", "💡 Text view", "🏝 Web view"], ["🧞‍♀️ Date Picker", "🥇 Button", "🏄🏻‍♀️ Color wells", "🏊‍♀️ Context menus", "🏄🏻‍♀️ Edit menus", "🎪 Pickers", "🏵 Pull down menus", "🎲 Segmented Controls", "🫖 Sliders", "🍭 Steppers", "🥂 Switches", "🍥 Text Fields"]] // [[], []]
    
    private lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .insetGrouped)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "house"), tag: 20)
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Home"
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func loadUser(){
        tableView.reloadData()
    }
    
    deinit {
        print("Welcome view controller dead!")
    }
    // MARK: action to close
    @objc private func close() {
        dismiss(animated: true) {
            // Do something after closed
            
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
        return uikitDoc.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return uikitDoc[section].count  // uikitDoc[0].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.accessoryType = .disclosureIndicator

        if indexPath.section == 0 {
            cell.textLabel?.text = uikitDoc[indexPath.section][indexPath.row]
        }else {
            cell.textLabel?.text = uikitDoc[indexPath.section][indexPath.row]
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    //    for header by defualt
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "UIkit Views"
        }else {
            return "Controls"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(uikitDoc[indexPath.section][indexPath.row])
        
//        switch indexPath.section {
//        case 0:
//            if indexPath.row == 0 {
//                let tbVC = TableViewViewController()
//                navigationController?.pushViewController(tbVC, animated: true)
//            }else if indexPath.row == 3 {
//                let tbVC = FirstViewController()
//                navigationController?.pushViewController(tbVC, animated: true)
//            }
//            else if indexPath.row == 6 {
//                let splitVC = UISplitViewController()
////                navigationController?.pushViewController(tbVC, animated: true)
//                splitVC.preferredDisplayMode = .oneBesideSecondary
//
//                let primaryVC = PrimaryViewController()
//                let nvc = UINavigationController(rootViewController: primaryVC)
//                primaryVC.view.backgroundColor = .red
//                let secondaryVC = UIViewController()
//                secondaryVC.view.backgroundColor = .blue
//                splitVC.viewControllers = [nvc, secondaryVC]
//                present(splitVC, animated: true)
//            }
//            else if indexPath.row == 7 {
//                let tbVC = FormViewController()
//                navigationController?.pushViewController(tbVC, animated: true)
//            }
//            else if indexPath.row == 8 {
//                let tbVC = UITabBarController()
////                navigationController?.pushViewController(tbVC, animated: true)
//                tbVC.viewControllers = [UIViewController(), UIViewController()]
//                present(tbVC, animated: true)
//            }
//        case 1:
//            if indexPath.row == 0 {
//                let tbVC = DatePickerViewController()
//                navigationController?.pushViewController(tbVC, animated: true)
//            }
//            else if indexPath.row == 5 {
//                let tbVC = PickerViewController()
//                present(tbVC, animated: true)
////                navigationController?.pushViewController(tbVC, animated: true)
//            }
//        default:
//            break
//        }
//
    }
}

