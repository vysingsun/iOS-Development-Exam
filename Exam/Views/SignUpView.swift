//
//  SignUpUIView.swift
//  Exam
//
//  Created by Phalkun Panha on 13/9/23.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func submit()
    func pickImage(rect: CGRect)
    func pickLabel()
}

class SignUpView: UIView {
    
    private let places = ["Phnom Penh", "Banteaymeanchey", "Battambong", "Kep", "Kog kong", "Takeo", "Pilen", "Kampot"]

    private var profile: UIImageView!
    private var cameraImageV: UIImageView!
    private var control: UIControl!
    
    private var pickerView: UIPickerView!
    
    private var ctControl: UIControl!
    private var ctTextField = UITextField()
    private var selectLabel: UILabel!
    
    private var datePickerView: UIDatePicker!
    private var bdTextField = UITextField()
    private var bdText: UILabel!
    
    private var borderTextFieldPwd: UIView!
    private var pwdIcon: UIImageView!
    private var textFieldPwd: UITextField!
    
    private var btnSignUp: UIButton!
    
    weak var delegate: SignUpViewDelegate?
    
    init() {
        super.init(frame: .zero)
        
        profile = UIImageView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.image = UIImage(named: "users")
        
        cameraImageV = UIImageView()
        cameraImageV.translatesAutoresizingMaskIntoConstraints = false
        cameraImageV.image = UIImage(named: "camera")
        
        control = UIControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        
        borderTextFieldPwd = UIView()
        borderTextFieldPwd.translatesAutoresizingMaskIntoConstraints = false
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
        
        btnSignUp = UIButton(type: .system)
        btnSignUp.translatesAutoresizingMaskIntoConstraints = false
        btnSignUp.setTitle("Sign Up", for: .normal)
        btnSignUp.addTarget(self, action: #selector(submit), for: .touchUpInside)
        btnSignUp.backgroundColor = .blue
        btnSignUp.layer.cornerRadius = 10
        btnSignUp.setTitleColor(.white, for: .normal)
        btnSignUp.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        addSubview(btnSignUp)
        addSubview(profile)
        addSubview(cameraImageV)
        addSubview(control)
        
        addSubview(borderTextFieldPwd)
        borderTextFieldPwd.addSubview(pwdIcon)
        borderTextFieldPwd.addSubview(textFieldPwd)

        profile.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 150).isActive = true
        profile.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profile.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        profile.layer.masksToBounds = true
        control.layer.masksToBounds = true
        
        cameraImageV.widthAnchor.constraint(equalToConstant: 30).isActive = true
        cameraImageV.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cameraImageV.centerXAnchor.constraint(equalTo: profile.centerXAnchor).isActive = true
        cameraImageV.bottomAnchor.constraint(equalTo: profile.bottomAnchor,constant: -5).isActive = true
        
        control.topAnchor.constraint(equalTo: profile.topAnchor).isActive = true
        control.bottomAnchor.constraint(equalTo: profile.bottomAnchor).isActive = true
        control.leadingAnchor.constraint(equalTo: profile.leadingAnchor).isActive = true
        control.trailingAnchor.constraint(equalTo: profile.trailingAnchor).isActive = true
        
        let borderTextField = UIView()
        borderTextField.translatesAutoresizingMaskIntoConstraints = false
        borderTextField.layer.cornerRadius = 4
        borderTextField.layer.borderColor = UIColor.lightGray.cgColor
        borderTextField.layer.borderWidth = 1
        
        addSubview(borderTextField)
                
        borderTextField.topAnchor.constraint(equalTo: profile.bottomAnchor,constant: 10).isActive = true
        borderTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        borderTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        borderTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        let userImg = UIImageView()
        userImg.translatesAutoresizingMaskIntoConstraints = false
        userImg.image = UIImage(named: "user")
        
        borderTextField.addSubview(userImg)
        
        userImg.centerYAnchor.constraint(equalTo: borderTextField.centerYAnchor).isActive = true
        userImg.leadingAnchor.constraint(equalTo: borderTextField.leadingAnchor,constant: 10).isActive = true
        userImg.widthAnchor.constraint(equalToConstant: 25).isActive = true
        userImg.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Username"
        
        borderTextField.addSubview(nameTextField)
        
        nameTextField.centerYAnchor.constraint(equalTo: borderTextField.centerYAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: userImg.trailingAnchor,constant: 10).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: borderTextField.trailingAnchor).isActive = true
        
        let cityLabel = UILabel()
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.text = "City"
        cityLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        addSubview(cityLabel)
        
        cityLabel.topAnchor.constraint(equalTo: borderTextField.bottomAnchor,constant: 10).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: borderTextField.leadingAnchor).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        cityLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        ctControl = UIControl()
        ctControl.translatesAutoresizingMaskIntoConstraints = false
        ctControl.backgroundColor = .lightGray
        ctControl.layer.cornerRadius = 4
        
        let chevron_down_img = UIImageView()
        chevron_down_img.translatesAutoresizingMaskIntoConstraints = false
        chevron_down_img.image = UIImage(named: "down-arrow")
        
        selectLabel = UILabel()
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        selectLabel.text = "Select City"
        selectLabel.textColor = .darkGray
        
        pickerView = UIPickerView()
        
        addSubview(ctControl)
        
        ctTextField.inputView = pickerView
        ctControl.addSubview(ctTextField)
        ctControl.addSubview(chevron_down_img)
        ctControl.addSubview(selectLabel)
        ctControl.addTarget(self, action: #selector(picker), for: .touchUpInside)
        
        ctControl.centerYAnchor.constraint(equalTo: cityLabel.centerYAnchor).isActive = true
        ctControl.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor,constant: 15).isActive = true
        ctControl.trailingAnchor.constraint(equalTo: borderTextField.trailingAnchor).isActive = true
        ctControl.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        selectLabel.centerYAnchor.constraint(equalTo: ctControl.centerYAnchor).isActive = true
        selectLabel.leadingAnchor.constraint(equalTo: ctControl.leadingAnchor,constant: 20).isActive = true
        selectLabel.trailingAnchor.constraint(equalTo: chevron_down_img.leadingAnchor).isActive = true
        
        chevron_down_img.trailingAnchor.constraint(equalTo: ctControl.trailingAnchor,constant: -10).isActive = true
        chevron_down_img.centerYAnchor.constraint(equalTo: ctControl.centerYAnchor).isActive = true
        chevron_down_img.heightAnchor.constraint(equalToConstant: 20).isActive = true
        chevron_down_img.widthAnchor.constraint(equalToConstant: 25).isActive = true

        
        let controlBd = UIControl()
        controlBd.translatesAutoresizingMaskIntoConstraints = false
        controlBd.backgroundColor = .lightGray
        controlBd.layer.cornerRadius = 4
        controlBd.addTarget(self, action: #selector(pickerDate), for: .touchUpInside)
        
        addSubview(controlBd)
        
        datePickerView = UIDatePicker()
//        datePickerView.datePickerMode = .date
        datePickerView.preferredDatePickerStyle = .wheels
        
                
        bdTextField.inputView = datePickerView
        controlBd.addSubview(bdTextField)
        
        controlBd.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant: 10).isActive = true
        controlBd.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor).isActive = true
        controlBd.trailingAnchor.constraint(equalTo: ctControl.trailingAnchor).isActive = true
        controlBd.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        bdText = UILabel()
        bdText.translatesAutoresizingMaskIntoConstraints = false
        bdText.text = "Birthday"
        bdText.textColor = .darkGray
        
        controlBd.addSubview(bdText)
        
        bdText.centerYAnchor.constraint(equalTo: controlBd.centerYAnchor).isActive = true
//        bdText.trailingAnchor.constraint(equalTo: controlBd.trailingAnchor).isActive = true
        bdText.leadingAnchor.constraint(equalTo: controlBd.leadingAnchor,constant: 10).isActive = true
        
        borderTextFieldPwd.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        borderTextFieldPwd.topAnchor.constraint(equalTo: controlBd.bottomAnchor,constant: 10).isActive = true
        borderTextFieldPwd.widthAnchor.constraint(equalToConstant: 200).isActive = true
        borderTextFieldPwd.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        pwdIcon.centerYAnchor.constraint(equalTo: borderTextFieldPwd.centerYAnchor).isActive = true
        pwdIcon.leadingAnchor.constraint(equalTo: borderTextFieldPwd.leadingAnchor,constant: 10).isActive = true
        pwdIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        pwdIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        textFieldPwd.centerYAnchor.constraint(equalTo: borderTextFieldPwd.centerYAnchor).isActive = true
        textFieldPwd.leadingAnchor.constraint(equalTo: pwdIcon.trailingAnchor,constant: 10).isActive = true
        textFieldPwd.trailingAnchor.constraint(equalTo: borderTextFieldPwd.trailingAnchor).isActive = true

        btnSignUp.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btnSignUp.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        btnSignUp.heightAnchor.constraint(equalToConstant: 45).isActive = true
        btnSignUp.widthAnchor.constraint(equalToConstant: 120).isActive = true
    
    }
    
    @objc private func picker() {
        pickerView.dataSource = self
        pickerView.delegate = self
        
        backgroundColor = .white
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickDone))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexible, doneBtn], animated: true)
        ctTextField.inputAccessoryView = toolBar
        ctTextField.becomeFirstResponder()
    }
    
    @objc private func clickDone(){
        ctTextField.resignFirstResponder()
    }
    
    @objc private func pickerDate() {
        backgroundColor = .white
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickDoneCloseDate))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexible, doneBtn], animated: true)
        bdTextField.inputAccessoryView = toolBar
        bdTextField.becomeFirstResponder()
    }
    
    @objc private func clickDoneCloseDate(){
        bdTextField.resignFirstResponder()
//        bdText.text = "\(datePickerView.date)"
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM-dd-yyyy"
//        dateFormatter.timeZone = NSTimeZone(name: "UTC") as! TimeZone
//        let date: NSDate? = dateFormatter.date(from: "\(datePickerView.date)") as NSDate?
//
//        print(date)
//        let myDate = dateFormatter.string(from: date as! Date)
//
//        bdText.text = myDate
//
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd,yyyy"

        let date = dateFormatter.string(from: datePickerView.date) 
        print(date)
//        let myDate = dateFormatter.string(from: date!)

        bdText.text = date
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func submit() {
        delegate?.submit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        profile.layer.cornerRadius = profile.frame.width / 2
        control.layer.cornerRadius = profile.frame.width / 2
    }
    
    func setImage(_ image: UIImage) {
        profile.image = image
    }
    @objc private func pickImage(){
        delegate?.pickImage(rect: cameraImageV.frame)
    }
    @objc private func pickLabel(){
        delegate?.pickLabel()
    }
}

extension SignUpView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return places.count
    }
}

extension SignUpView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return places[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(places[row])
        selectLabel.text = places[row]
    }
}

