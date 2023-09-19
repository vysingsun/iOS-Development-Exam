//
//  PrimaryViewController.swift
//  Exam
//
//  Created by Phalkun Panha on 14/9/23.
//

import UIKit

class PrimaryViewController: UIViewController {

    private var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.frame = view.frame
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension PrimaryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    
}

extension PrimaryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.row {
//            case 0:
//                let formVC = FormViewController()
//                let isPad = UIDevice.current.userInterfaceIdiom == .pad
//                if isPad {
//                    splitViewController?.viewControllers.remove(at: 1)
//                    splitViewController?.viewControllers.append(formVC)
//                }else{
//                    present(formVC, animated: true)
//                }
////                break
//            case 1:
//                break
//            case 2:
//                break
//        default:
//            break
//        }
    }
}
