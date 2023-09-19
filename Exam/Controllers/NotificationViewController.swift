//
//  NotificationViewController.swift
//  Exam
//
//  Created by Phalkun Panha on 14/9/23.
//

import UIKit

class NotificationViewController: UIViewController {
    
    private var sneakersLabel: UILabel!
    
    private var searchImg: UIImageView!
    
    private var searchTextField: UITextField!
    
    private var topBrandsLabel: UILabel!
    
    private var nikeView: UIView!
    private var nikeImg: UIImageView!
    
    private var adidasView: UIView!
    private var adidasImg: UIImageView!
    
    private var pumaView: UIView!
    private var pumaImg: UIImageView!
    
    private var jordanView: UIView!
    private var jordanImg: UIImageView!
    
    
    private var popularLabel: UILabel!
    
    private var bgNikeProduct: UIView!
    private var nikeImg2: UIImageView!
    private var nikeProductImg: UIImageView!
    private var priceNike: UILabel!
    private var nameNike: UILabel!
    
    private var bgAdidasProduct: UIView!
    private var adidasImg2: UIImageView!
    private var adidasProImg: UIImageView!
    private var priceAdidas: UILabel!
    private var nameAdidas: UILabel!

    private var bgPumaProduct: UIView!
    private var pumaImg2: UIImageView!
    private var pumaProImg: UIImageView!
    private var pricePuma: UILabel!
//    private var namePuma: UILabel!
    
    private var bgJordanProduct: UIView!
    private var jordanImg2: UIImageView!
    private var jordanProImg: UIImageView!
//    private var priceJordan: UILabel!
//    private var nameJordan: UILabel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Notification", image: UIImage(named: "bell"), tag: 20)

        sneakersLabel = UILabel()
        sneakersLabel.translatesAutoresizingMaskIntoConstraints = false
        sneakersLabel.text = "Sneakers"
        sneakersLabel.adjustsFontSizeToFitWidth = true
        sneakersLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
//        sneakersLabel.font = UIFont.boldSystemFont(ofSize: 32)

        view.addSubview(sneakersLabel)

        sneakersLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        sneakersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 28).isActive = true
        
        searchImg = UIImageView()
        searchImg.translatesAutoresizingMaskIntoConstraints = false
        searchImg.image = UIImage(named: "search")
        
        view.addSubview(searchImg)
        
        searchImg.topAnchor.constraint(equalTo: sneakersLabel.bottomAnchor,constant: 20).isActive = true
        searchImg.leadingAnchor.constraint(equalTo: sneakersLabel.leadingAnchor).isActive = true
        
        searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        
        view.addSubview(searchTextField)
        
        searchTextField.centerYAnchor.constraint(equalTo: searchImg.centerYAnchor).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: searchImg.trailingAnchor,constant: 8).isActive = true
        
        topBrandsLabel = UILabel()
        topBrandsLabel.translatesAutoresizingMaskIntoConstraints = false
        topBrandsLabel.text = "Top Brands"
        topBrandsLabel.font = UIFont.systemFont(ofSize: 28)
        
        view.addSubview(topBrandsLabel)
        
        topBrandsLabel.topAnchor.constraint(equalTo: searchImg.bottomAnchor,constant: 20).isActive = true
        topBrandsLabel.leadingAnchor.constraint(equalTo: searchImg.leadingAnchor).isActive = true
        
        nikeView = UIView()
        nikeView.translatesAutoresizingMaskIntoConstraints = false
        nikeView.backgroundColor = .lightGray
        nikeView.layer.cornerRadius = 10
        
        view.addSubview(nikeView)
        
        nikeView.topAnchor.constraint(equalTo: topBrandsLabel.bottomAnchor,constant: 15).isActive = true
        nikeView.leadingAnchor.constraint(equalTo: topBrandsLabel.leadingAnchor).isActive = true
        nikeView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        nikeView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        nikeImg = UIImageView()
        nikeImg.translatesAutoresizingMaskIntoConstraints = false
        nikeImg.image = UIImage(named: "nike")
        
        nikeView.addSubview(nikeImg)
        
        nikeImg.centerXAnchor.constraint(equalTo: nikeView.centerXAnchor).isActive = true
        nikeImg.centerYAnchor.constraint(equalTo: nikeView.centerYAnchor).isActive = true
        nikeImg.widthAnchor.constraint(equalToConstant: 45).isActive = true
        nikeImg.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        adidasView = UIView()
        adidasView.translatesAutoresizingMaskIntoConstraints = false
        adidasView.backgroundColor = .lightGray
        adidasView.layer.cornerRadius = 10
        
        view.addSubview(adidasView)
        
        adidasView.centerYAnchor.constraint(equalTo: nikeView.centerYAnchor).isActive = true
        adidasView.leadingAnchor.constraint(equalTo: nikeView.trailingAnchor,constant: 25).isActive = true
        adidasView.widthAnchor.constraint(equalTo: nikeView.widthAnchor).isActive = true
        adidasView.heightAnchor.constraint(equalTo: nikeView.heightAnchor).isActive = true
        
        adidasImg = UIImageView()
        adidasImg.translatesAutoresizingMaskIntoConstraints = false
        adidasImg.image = UIImage(named: "adidas")
        
        adidasView.addSubview(adidasImg)
        
        adidasImg.centerXAnchor.constraint(equalTo: adidasView.centerXAnchor).isActive = true
        adidasImg.centerYAnchor.constraint(equalTo: adidasView.centerYAnchor).isActive = true
        adidasImg.widthAnchor.constraint(equalToConstant: 45).isActive = true
        adidasImg.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        jordanView = UIView()
        jordanView.translatesAutoresizingMaskIntoConstraints = false
        jordanView.backgroundColor = .lightGray
        jordanView.layer.cornerRadius = 10
        
        view.addSubview(jordanView)
        
        jordanView.centerYAnchor.constraint(equalTo: nikeView.centerYAnchor).isActive = true
        jordanView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -28).isActive = true
        jordanView.widthAnchor.constraint(equalTo: nikeView.widthAnchor).isActive = true
        jordanView.heightAnchor.constraint(equalTo: nikeView.heightAnchor).isActive = true
        
        jordanImg = UIImageView()
        jordanImg.translatesAutoresizingMaskIntoConstraints = false
        jordanImg.image = UIImage(named: "jordan")
        
        jordanView.addSubview(jordanImg)
        
        jordanImg.centerYAnchor.constraint(equalTo: jordanView.centerYAnchor).isActive = true
        jordanImg.centerXAnchor.constraint(equalTo: jordanView.centerXAnchor).isActive = true
        
        pumaView = UIView()
        pumaView.translatesAutoresizingMaskIntoConstraints = false
        pumaView.backgroundColor = .lightGray
        pumaView.layer.cornerRadius = 10
        
        view.addSubview(pumaView)
        
        pumaView.centerYAnchor.constraint(equalTo: nikeView.centerYAnchor).isActive = true
        pumaView.trailingAnchor.constraint(equalTo: jordanView.leadingAnchor,constant: -25).isActive = true
        pumaView.widthAnchor.constraint(equalTo: nikeView.widthAnchor).isActive = true
        pumaView.heightAnchor.constraint(equalTo: nikeView.heightAnchor).isActive = true
        
        pumaImg = UIImageView()
        pumaImg.translatesAutoresizingMaskIntoConstraints = false
        pumaImg.image = UIImage(named: "Puma-Logo")
        
        pumaView.addSubview(pumaImg)
        
        pumaImg.centerYAnchor.constraint(equalTo: pumaView.centerYAnchor).isActive = true
        pumaImg.centerXAnchor.constraint(equalTo: pumaView.centerXAnchor).isActive = true
        
        popularLabel = UILabel()
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        popularLabel.text = "Popular"
        popularLabel.font = UIFont.systemFont(ofSize: 28)
        
        view.addSubview(popularLabel)
        
        popularLabel.topAnchor.constraint(equalTo: nikeView.bottomAnchor,constant: 15).isActive = true
        popularLabel.leadingAnchor.constraint(equalTo: nikeView.leadingAnchor).isActive = true
        
        bgNikeProduct = UIView()
        bgNikeProduct.translatesAutoresizingMaskIntoConstraints = false
        bgNikeProduct.backgroundColor = .lightGray
        bgNikeProduct.layer.cornerRadius = 10
        
        view.addSubview(bgNikeProduct)
        
        bgNikeProduct.topAnchor.constraint(equalTo: popularLabel.bottomAnchor,constant: 35).isActive = true
        bgNikeProduct.leadingAnchor.constraint(equalTo: popularLabel.leadingAnchor,constant: 10).isActive = true
        bgNikeProduct.widthAnchor.constraint(equalToConstant: 165).isActive = true
        bgNikeProduct.heightAnchor.constraint(equalToConstant: 165).isActive = true
        
        nikeProductImg = UIImageView()
        nikeProductImg.translatesAutoresizingMaskIntoConstraints = false
        nikeProductImg.image = UIImage(named: "nike-shoes-white")
        
        bgNikeProduct.addSubview(nikeProductImg)
        
        nikeProductImg.centerYAnchor.constraint(equalTo: bgNikeProduct.centerYAnchor).isActive = true
        nikeProductImg.centerXAnchor.constraint(equalTo: bgNikeProduct.centerXAnchor).isActive = true
        nikeProductImg.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nikeProductImg.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        nikeImg2 = UIImageView()
        nikeImg2.translatesAutoresizingMaskIntoConstraints = false
        nikeImg2.image = UIImage(named: "nike")
        
        bgNikeProduct.addSubview(nikeImg2)
        
        nikeImg2.bottomAnchor.constraint(equalTo: bgNikeProduct.bottomAnchor,constant: -10).isActive = true
        nikeImg2.trailingAnchor.constraint(equalTo: bgNikeProduct.trailingAnchor,constant: -10).isActive = true
        nikeImg2.widthAnchor.constraint(equalToConstant: 35).isActive = true
        nikeImg2.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        priceNike = UILabel()
        priceNike.translatesAutoresizingMaskIntoConstraints = false
        priceNike.text = "$239.80"
        priceNike.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        view.addSubview(priceNike)
        
        priceNike.topAnchor.constraint(equalTo: bgNikeProduct.bottomAnchor,constant: 15).isActive = true
        priceNike.leadingAnchor.constraint(equalTo: bgNikeProduct.leadingAnchor).isActive = true
        
        nameNike = UILabel()
        nameNike.translatesAutoresizingMaskIntoConstraints = false
        nameNike.text = "Nike Air Max 90"
        nameNike.textColor = .lightGray
        
        view.addSubview(nameNike)
        
        nameNike.topAnchor.constraint(equalTo: priceNike.bottomAnchor).isActive = true
        nameNike.leadingAnchor.constraint(equalTo: priceNike.leadingAnchor).isActive = true
        
        bgAdidasProduct = UIView()
        bgAdidasProduct.translatesAutoresizingMaskIntoConstraints = false
        bgAdidasProduct.backgroundColor = .lightGray
        bgAdidasProduct.layer.cornerRadius = 10
        
        view.addSubview(bgAdidasProduct)
        
        bgAdidasProduct.topAnchor.constraint(equalTo: bgNikeProduct.topAnchor,constant: 25).isActive = true
        bgAdidasProduct.trailingAnchor.constraint(equalTo: jordanView.trailingAnchor,constant: -10).isActive = true
        bgAdidasProduct.widthAnchor.constraint(equalTo: bgNikeProduct.widthAnchor).isActive = true
        bgAdidasProduct.heightAnchor.constraint(equalTo: bgNikeProduct.heightAnchor).isActive = true
        
        adidasProImg = UIImageView()
        adidasProImg.translatesAutoresizingMaskIntoConstraints = false
        adidasProImg.image = UIImage(named: "adidas-sneaker-white")
//        adidasProImg.backgroundColor = .orange
        
        bgAdidasProduct.addSubview(adidasProImg)
        
        adidasProImg.centerYAnchor.constraint(equalTo: bgAdidasProduct.centerYAnchor).isActive = true
        adidasProImg.centerXAnchor.constraint(equalTo: bgAdidasProduct.centerXAnchor).isActive = true
        adidasProImg.widthAnchor.constraint(equalToConstant: 165).isActive = true
        adidasProImg.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        adidasImg2 = UIImageView()
        adidasImg2.translatesAutoresizingMaskIntoConstraints = false
        adidasImg2.image = UIImage(named: "adidas")
        
        bgAdidasProduct.addSubview(adidasImg2)
        
        adidasImg2.bottomAnchor.constraint(equalTo: bgAdidasProduct.bottomAnchor,constant: -10).isActive = true
        adidasImg2.trailingAnchor.constraint(equalTo: bgAdidasProduct.trailingAnchor,constant: -10).isActive = true
        adidasImg2.widthAnchor.constraint(equalToConstant: 35).isActive = true
        adidasImg2.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        priceAdidas = UILabel()
        priceAdidas.translatesAutoresizingMaskIntoConstraints = false
        priceAdidas.text = "$229.80"
        priceAdidas.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        view.addSubview(priceAdidas)
        
        priceAdidas.topAnchor.constraint(equalTo: bgAdidasProduct.bottomAnchor,constant: 15).isActive = true
        priceAdidas.leadingAnchor.constraint(equalTo: bgAdidasProduct.leadingAnchor).isActive = true
        
        nameAdidas = UILabel()
        nameAdidas.translatesAutoresizingMaskIntoConstraints = false
        nameAdidas.text = "Adidas Air Force 90"
        nameAdidas.textColor = .lightGray
        
        view.addSubview(nameAdidas)
        
        nameAdidas.topAnchor.constraint(equalTo: priceAdidas.bottomAnchor).isActive = true
        nameAdidas.leadingAnchor.constraint(equalTo: priceAdidas.leadingAnchor).isActive = true
        
        bgPumaProduct = UIView()
        bgPumaProduct.translatesAutoresizingMaskIntoConstraints = false
        bgPumaProduct.backgroundColor = .lightGray
        bgPumaProduct.layer.cornerRadius = 10
        
        view.addSubview(bgPumaProduct)
        
        bgPumaProduct.topAnchor.constraint(equalTo: nameNike.bottomAnchor,constant: 15).isActive = true
        bgPumaProduct.leadingAnchor.constraint(equalTo: nameNike.leadingAnchor).isActive = true
        bgPumaProduct.widthAnchor.constraint(equalTo: bgNikeProduct.widthAnchor).isActive = true
        bgPumaProduct.heightAnchor.constraint(equalTo: bgNikeProduct.heightAnchor).isActive = true
        
        pumaProImg = UIImageView()
        pumaProImg.translatesAutoresizingMaskIntoConstraints = false
        pumaProImg.image = UIImage(named: "puma-sneaker")
//        adidasProImg.backgroundColor = .orange
        
        bgPumaProduct.addSubview(pumaProImg)
        
        pumaProImg.centerYAnchor.constraint(equalTo: bgPumaProduct.centerYAnchor).isActive = true
        pumaProImg.centerXAnchor.constraint(equalTo: bgPumaProduct.centerXAnchor).isActive = true
//        pumaProImg.widthAnchor.constraint(equalToConstant: 165).isActive = true
//        pumaProImg.heightAnchor.constraint(equalToConstant: 110).isActive = true

        
        pumaImg2 = UIImageView()
        pumaImg2.translatesAutoresizingMaskIntoConstraints = false
        pumaImg2.image = UIImage(named: "Puma-Logo")
        
        bgPumaProduct.addSubview(pumaImg2)
        
        pumaImg2.bottomAnchor.constraint(equalTo: bgPumaProduct.bottomAnchor,constant:  -10).isActive = true
        pumaImg2.trailingAnchor.constraint(equalTo: bgPumaProduct.trailingAnchor,constant: -10).isActive = true
        
        pricePuma = UILabel()
        pricePuma.translatesAutoresizingMaskIntoConstraints = false
        pricePuma.text = "$239.80"
        pricePuma.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        view.addSubview(pricePuma)
        
        pricePuma.topAnchor.constraint(equalTo: bgPumaProduct.bottomAnchor,constant: 15).isActive = true
        pricePuma.leadingAnchor.constraint(equalTo: bgPumaProduct.leadingAnchor).isActive = true
        
        bgJordanProduct = UIView()
        bgJordanProduct.translatesAutoresizingMaskIntoConstraints = false
        bgJordanProduct.backgroundColor = .lightGray
        bgJordanProduct.layer.cornerRadius = 10
        
        view.addSubview(bgJordanProduct)
        
        bgJordanProduct.topAnchor.constraint(equalTo: nameAdidas.bottomAnchor,constant: 15).isActive = true
        bgJordanProduct.trailingAnchor.constraint(equalTo: bgAdidasProduct.trailingAnchor).isActive = true
        bgJordanProduct.widthAnchor.constraint(equalTo: bgNikeProduct.widthAnchor).isActive = true
        bgJordanProduct.heightAnchor.constraint(equalTo: bgNikeProduct.heightAnchor).isActive = true
        
        jordanProImg = UIImageView()
        jordanProImg.translatesAutoresizingMaskIntoConstraints = false
        jordanProImg.image = UIImage(named: "jordan-sneaker")
//        adidasProImg.backgroundColor = .orange
        
        bgJordanProduct.addSubview(jordanProImg)
        
        jordanProImg.centerYAnchor.constraint(equalTo: bgJordanProduct.centerYAnchor).isActive = true
        jordanProImg.centerXAnchor.constraint(equalTo: bgJordanProduct.centerXAnchor).isActive = true
        jordanProImg.widthAnchor.constraint(equalToConstant: 160).isActive = true
        jordanProImg.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
        jordanImg2 = UIImageView()
        jordanImg2.translatesAutoresizingMaskIntoConstraints = false
        jordanImg2.image = UIImage(named: "jordan")
        
        bgJordanProduct.addSubview(jordanImg2)
        
        jordanImg2.bottomAnchor.constraint(equalTo: bgJordanProduct.bottomAnchor,constant:  -10).isActive = true
        jordanImg2.trailingAnchor.constraint(equalTo: bgJordanProduct.trailingAnchor,constant: -10).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "bells"), style: .plain, target: self, action: #selector(close))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(hexString: "000000")
//        navigationItem.rightBarButtonItem?.tintColor =
        
        let tapGus = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapGus)
        
    }
    
    @objc private func closeKeyboard(){
        searchTextField.resignFirstResponder()
    }
        
    @objc private func close() {
        
    }
}
