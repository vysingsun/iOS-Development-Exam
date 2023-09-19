//
//  LoginView.swift
//  Exam
//
//  Created by Phalkun Panha on 11/9/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func onLogin(_ username: String, _ password: String)
    func onSignup()
}

class LoginView: UIView {
    
    private var content: UIView!
    private var imgLogo: UIImageView!
    private var label: UILabel!
    
    private var borderTextFieldUser: UIView!
    private var borderTextFieldPwd: UIView!
    
    private var userIcon: UIImageView!
    private var pwdIcon: UIImageView!
    
    private var textFieldUser: UITextField!
    private var textFieldPwd: UITextField!
    
    private var btnLogin: UIButton!
    private var btnSignup: UIButton!
    
    weak var delegate: LoginViewDelegate?
    
    init(){
        super.init(frame: .zero)
        
        borderTextFieldPwd = UIView()
        borderTextFieldPwd.translatesAutoresizingMaskIntoConstraints = false
//        borderTextFieldPwd.backgroundColor = .lightGray
        borderTextFieldPwd.layer.cornerRadius = 6
        borderTextFieldPwd.layer.borderColor = UIColor.lightGray.cgColor
        borderTextFieldPwd.layer.borderWidth = 1
        
        pwdIcon = UIImageView()
        pwdIcon.translatesAutoresizingMaskIntoConstraints = false
        pwdIcon.image = UIImage(named: "padlock")
        
        textFieldPwd = UITextField()
        textFieldPwd.translatesAutoresizingMaskIntoConstraints = false
        textFieldPwd.placeholder = "Password"
        textFieldPwd.isSecureTextEntry = true
        
        borderTextFieldUser = UIView()
        borderTextFieldUser.translatesAutoresizingMaskIntoConstraints = false
//        borderTextFieldUser.backgroundColor = .lightGray
        borderTextFieldUser.layer.cornerRadius = 6
        borderTextFieldUser.layer.borderColor = UIColor.lightGray.cgColor
        borderTextFieldUser.layer.borderWidth = 1
        
        userIcon = UIImageView()
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.image = UIImage(named: "user")
        
        textFieldUser = UITextField()
        textFieldUser.translatesAutoresizingMaskIntoConstraints = false
        textFieldUser.placeholder = "Username"
        
        content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
//        content.backgroundColor = .black
        
        imgLogo = UIImageView()
        imgLogo.translatesAutoresizingMaskIntoConstraints = false
        imgLogo.image = UIImage(named: "apple-icon")

        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome!"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
        
        btnLogin = UIButton()
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        btnLogin.backgroundColor = .blue
        btnLogin.setTitle("Login", for: .normal)
        btnLogin.layer.cornerRadius = 6
        btnLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        btnSignup = UIButton()
        btnSignup.translatesAutoresizingMaskIntoConstraints = false
        btnSignup.setTitle("Sign up?", for: .normal)
        btnSignup.setTitleColor(.blue, for: .normal)
        btnSignup.addTarget(self, action: #selector(signup), for: .touchUpInside)
        
        addSubview(borderTextFieldUser)
        borderTextFieldUser.addSubview(userIcon)
        borderTextFieldUser.addSubview(textFieldUser)
        
        addSubview(borderTextFieldPwd)
        borderTextFieldPwd.addSubview(pwdIcon)
        borderTextFieldPwd.addSubview(textFieldPwd)

        addSubview(content)
        content.addSubview(imgLogo)
        content.addSubview(label)
        
        addSubview(btnLogin)
        addSubview(btnSignup)
        
        borderTextFieldPwd.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        borderTextFieldPwd.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        borderTextFieldPwd.widthAnchor.constraint(equalToConstant: 240).isActive = true
        borderTextFieldPwd.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        pwdIcon.centerYAnchor.constraint(equalTo: borderTextFieldPwd.centerYAnchor).isActive = true
        pwdIcon.leadingAnchor.constraint(equalTo: borderTextFieldPwd.leadingAnchor,constant: 10).isActive = true
        pwdIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        pwdIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        textFieldPwd.centerYAnchor.constraint(equalTo: borderTextFieldPwd.centerYAnchor).isActive = true
        textFieldPwd.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor,constant: 10).isActive = true
        textFieldPwd.trailingAnchor.constraint(equalTo: borderTextFieldPwd.trailingAnchor).isActive = true
        
        borderTextFieldUser.bottomAnchor.constraint(equalTo: borderTextFieldPwd.topAnchor,constant: -10).isActive = true
        borderTextFieldUser.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        borderTextFieldUser.widthAnchor.constraint(equalToConstant: 240).isActive = true
        borderTextFieldUser.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        userIcon.centerYAnchor.constraint(equalTo: borderTextFieldUser.centerYAnchor).isActive = true
        userIcon.leadingAnchor.constraint(equalTo: borderTextFieldUser.leadingAnchor,constant: 10).isActive = true
        userIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        userIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        textFieldUser.centerYAnchor.constraint(equalTo: borderTextFieldUser.centerYAnchor).isActive = true
        textFieldUser.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor,constant: 10).isActive = true
        textFieldUser.trailingAnchor.constraint(equalTo: borderTextFieldUser.trailingAnchor).isActive = true
        
        content.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: borderTextFieldUser.topAnchor,constant: -10).isActive = true
        content.widthAnchor.constraint(equalToConstant: 120).isActive = true
        content.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        imgLogo.centerYAnchor.constraint(equalTo: content.centerYAnchor).isActive = true
        imgLogo.leadingAnchor.constraint(equalTo: content.leadingAnchor).isActive = true
        
        label.trailingAnchor.constraint(equalTo: content.trailingAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: content.centerYAnchor).isActive = true
        
        btnLogin.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btnLogin.topAnchor.constraint(equalTo: borderTextFieldPwd.bottomAnchor,constant: 45).isActive = true
        btnLogin.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        btnSignup.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btnSignup.topAnchor.constraint(equalTo: btnLogin.bottomAnchor,constant: 10).isActive = true
        
        textFieldUser.delegate = self
        textFieldPwd.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func login(){
        print("login")
        delegate?.onLogin(textFieldUser.text ?? "", textFieldPwd.text ?? "")
    }
    
    @objc private func signup(){
        print("signup")
        delegate?.onSignup()

    }
    
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
